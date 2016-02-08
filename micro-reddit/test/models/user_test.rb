require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "ubershibs", email: "luke.walker@gmail.com",
                     password: "swim3swim3", password_confirmation: "swim3swim3")
  end

  test "user should be valid" do 
    assert @user.valid?
  end

  test "username should be present" do 
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be 16 characters or fewer" do
    @user.username = "a" * 17
    assert_not @user.valid?
  end

  test "email should be optional" do
    @user.email = nil
    assert @user.valid?
  end

  test "email must be formatted correctly" do
    @user.email = "luke"
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a min length of 6" do
    @user.password = @user.password_confirmation = " " * 5
    assert_not @user.valid?
  end
end
