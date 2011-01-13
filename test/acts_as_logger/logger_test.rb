require "test_helper"

class ActsAsLogger::LoggerTest < ActiveSupport::TestCase
  setup do
    User.destroy_all
    @user1 = Factory.create(:user, :email => "contato2@lucasrenan.com")
    @user2 = Factory.create(:user, :email => "eduardobrando@gmail.com")
    
    ActsAsLogger::User.current = @user1
    @post = Factory.create(:post)
  end
  
  test "should be logger module" do
    assert_kind_of Module, ActsAsLogger::Logger
  end
  
  test "should return user that created the record" do
    assert_equal @user1, @post.created_by
  end
  
  test "should return user that updated the record" do
    ActsAsLogger::User.current = @user2
    @post.save
    
    assert_equal @user2, @post.updated_by
  end
end