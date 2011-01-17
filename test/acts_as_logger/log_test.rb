require File.expand_path("../../test_helper", __FILE__)

class ActsAsLogger::LogTest < ActiveSupport::TestCase
  test "should be log class" do
    assert_kind_of Class, ActsAsLogger::Log
  end
end