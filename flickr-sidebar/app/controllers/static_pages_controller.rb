class StaticPagesController < ApplicationController

  def home
    if params[:user_id]
      @user_id = params[:user_id]
    else
      @user_id = nil
    end
  end
end
