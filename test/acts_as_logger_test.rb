require File.expand_path("../test_helper", __FILE__)

class ActsAsLoggerTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ActsAsLogger
  end
end