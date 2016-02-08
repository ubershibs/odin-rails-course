require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @post = Post.new(title: "MacWorld", link: "http://www.macworld.com", user_id: "1")
  end

  test "post should be valid" do 
    assert @post.valid?
  end  

  test "title should be present" do
    @post.title = " "
    assert_not @post.valid?
  end

  test "title should be less than 255 long" do
    @post.title = "a" * 256
    assert_not @post.valid?
  end

  test "link should be present" do
    @post.link = " "
    assert_not @post.valid?
  end

  test "link should begin with http(s)://" do
    @post.link = "macworld.com"
    assert_not @post.valid?
    @post.link = "http://macworld.com"
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = " "
    assert_not @post.valid?
  end
end
