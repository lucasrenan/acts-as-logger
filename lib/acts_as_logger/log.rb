require 'mongoid'

module ActsAsLogger
  class Log
    include Mongoid::Document
    include Mongoid::Timestamps
  
    field :action
  end
end