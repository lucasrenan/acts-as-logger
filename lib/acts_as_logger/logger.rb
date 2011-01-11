module ActsAsLogger
  module Logger
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def acts_as_logger(options={})
        include InstanceMethods
        
        class_eval do
          before_save :created_or_updated_by
          embeds_many :logs, :class_name => "ActsAsLogger::Log" 
          attr_accessor :created_by, :updated_by
        end
        
        Log.class_eval do
          embedded_in self.to_s.downcase.to_sym, :inverse_of => :logs
          #FIXME - model fixo
          references_one :user
        end
        
        #FIXME - model fixo
        User.class_eval do
          referenced_in :log, :class_name => "ActsAsLogger::Log"
          
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
    end

  end
end