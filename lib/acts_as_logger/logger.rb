module ActsAsLogger
  module Logger
    extend ActiveSupport::Concern
    
    module ClassMethods
      def acts_as_logger(options={})
        include InstanceMethods
        
        class_eval do
          before_save :created_or_updated_by
          embeds_many :logs, :class_name => "ActsAsLogger::Log"
          #attr_accessor :created_by, :updated_by
        end
        
        Log.class_eval do
          embedded_in self.to_s.downcase.to_sym, :inverse_of => :logs
          
          #FIXME - model fixo
          referenced_in :user #, :store_as => :array
        end
        
        #FIXME - model fixo
        User.class_eval do
          references_many :logs, :class_name => "ActsAsLogger::Log"
          
          def self.current
            Thread.current[:user]
          end

          def self.current=(user)
            Thread.current[:user] = user
          end
        end
        
      end
    end
    
    module InstanceMethods
      def created_or_updated_by
        user = User.current

        unless user.nil?
          if self.new_record?
            self.created_by = user
          else
            self.updated_by = user
          end
        end
      end
      
      def created_by=(user)
        raise "created by is not null" unless self.logs.where(:action => :create).empty?
        self.logs << ActsAsLogger::Log.new(:action => :create, :user => user)
      end
      
      def created_by
        self.logs.where(:action => :create).first
      end
      
      def updated_by=(user)
        self.logs << ActsAsLogger::Log.new(:action => :update, :user => user)
      end
      
      def updated_by
        self.logs.where(:action => :update).desc(:created_at).first
      end
      
    end

  end
end