require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User can be set" do
    user = User.new
    assert_not user.save, "save the user without params"
  end
  #   assert true
  # end
end
