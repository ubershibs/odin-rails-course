require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment = Comment.new(comment: "hello", user_id: 1, post_id: 1)
  end

  test "comment should be present" do 
    @comment.comment = " "
    assert_not @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = " "
    assert_not @comment.valid?
  end

  test "post id should be present" do
    @comment.post_id = " "
    assert_not @comment.valid?
  end

end
