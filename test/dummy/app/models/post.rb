class Post
  include Mongoid::Document
  include ActsAsLogger::Logger
  
  acts_as_logger
  
  field :title, :type => String
  field :content, :type => String
end
