require 'test_helper'

class ActsAsLoggerTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ActsAsLogger
  end


  test "provisorio" do
    u = User.create(:email => "lucas@nudesign.com.br")
    User.current = u

    p = Post.new(:title => "title", :content => "content")
    assert p.save
  end

end
