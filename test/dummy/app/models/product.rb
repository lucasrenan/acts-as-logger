class Product
  include Mongoid::Document
  include ActsAsLogger::Logger
  
  acts_as_logger
  
  field :name, :type => String
  field :description, :type => String
end
