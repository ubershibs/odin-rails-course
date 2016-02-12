class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Post published!'
      redirect_to posts_path
    else
      render :new
    end
  end

  private
  def logged_in_user
    unless logged_in?
      flash.now[:danger] = 'Please log in'
      redirect_to login_path
    end
  end

  def user_params
    params.require(:post).permit(:title, :content)
  end
end
