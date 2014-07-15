class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:user])
    current_user.toggle_follow!(@user)
  end

  def unfollow
    @user = User.find(params[:user])
    current_user.unfollow!(@user)
  end

end
