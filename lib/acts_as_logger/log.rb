require 'mongoid'

module ActsAsLogger
  class Log
    include Mongoid::Document
    include Mongoid::Timestamps
    
    embedded_in :loggable, :inverse_of => :logs, :polymorphic => true
  
    field :action
  end
end