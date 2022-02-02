class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.last_recent_posts
  end
end
