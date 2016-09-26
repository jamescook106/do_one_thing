require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "Default User is not admin" do
    user=User.new
    user.save
    if user.admin
      assert false, 'Default User is an admin'
    else
      assert true, 'Default User is not an admin'
    end
  end

  test "Default User is not sadmin" do
    user=User.new
    user.save
    if user.sadmin
      assert false, 'Default User is an sadmin'
    else
      assert true, 'Default User is not an sadmin'
    end
  end

  # test "the truth" do
  #   assert true
  # end
end
