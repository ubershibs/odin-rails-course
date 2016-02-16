require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "user is valid" do 
    assert @user.valid?
  end

  test "name should be present" do 
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "neil@inv"
    assert_not @user.valid?
  end

  test "email should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "password should be at least six chars" do 
    @user.password = "fooba"
    @user.password_confirmation = "fooba"
    assert_not @user.valid?
  end

  test "password and confirmation should match" do
    @user.password = "foobar"
    @user.password_confirmation = "password"
    assert_not @user.valid?
  end

  test "password should be nonblank" do 
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end
end
