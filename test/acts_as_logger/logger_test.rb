require "test_helper"

class ActsAsLogger::LoggerTest < ActiveSupport::TestCase
  test "should be logger module" do
    assert_kind_of Module, ActsAsLogger::Logger
  end
end