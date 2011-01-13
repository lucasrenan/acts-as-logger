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

          #FIXME - model user fixo
          referenced_in :user, :inverse_of => :logs
        end
        
        #FIXME - model fixo
        # User.class_eval do
        #   #references_many :logs, :class_name => "ActsAsLogger::Log", :inverse_of => :users  
        # end
        
      end
    end
    
    module InstanceMethods
      def created_or_updated_by
        user = ActsAsLogger::User.current

        unless user.nil?
          if self.new_record?
            self.created_by = user
          else
            self.updated_by = user
          end
        end
      end
      
      #FIXME - model user fixo
      def created_by=(user)
        raise "created by is not null" unless self.logs.where(:action => :create).empty?
        self.logs << ActsAsLogger::Log.new(:action => :create, :user => user)
      end
      
      #FIXME - model user fixo
      def created_by
        self.logs.where(:action => :create).first.user
      end
      
      #FIXME - model user fixo
      def updated_by=(user)
        self.logs << ActsAsLogger::Log.new(:action => :update, :user => user)
      end
      
      #FIXME - model user fixo
      def updated_by
        if self.logs.where(:action => :update).count > 0
          self.logs.where(:action => :update).desc(:created_at).first.user
        end
      end
      
    end

  end
end