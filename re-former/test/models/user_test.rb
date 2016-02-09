require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "test12", email: "test@test.com", password: "123456",
                     password_confirmation: "123456")
  end

  test "user should be valid" do 
    assert @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " "
    assert_not @user.valid?
  end

  test "password should be at least 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be unique" do
    duplicate_user = @user.dup 
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "username should be between 6 and 20 characters" do
    @user.username = "a" * 5
    assert_not @user.valid?
    @user.username = "a" * 21
    assert_not @user.valid?
  end

  test "email is optional" do
    @user.email = nil
    assert @user.valid?
  end

  test "if present, email must be validly formatted" do
    @user.email = "luke"
    assert_not @user.valid?
    @user.email = "test@test.com"
    assert @user.valid?
  end
 
end
