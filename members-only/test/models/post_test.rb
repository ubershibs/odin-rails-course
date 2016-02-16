require 'test_helper'

class PostTest < ActiveSupport::TestCase
 
 def setup
  @post = Post.new(title: "Hello", Content: "Goodbye", user_id: 1)
end
