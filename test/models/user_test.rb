require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:userOne)
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    @user2 = User.new(email: "test1@test.com", password: "password")
    assert_not @user2.valid?
  end

end
