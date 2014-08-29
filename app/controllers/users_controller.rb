class UsersController < ApplicationController
  before_filter :authenticate_user!

  layout 'userlayout'

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

  def like
    @likeable = Video.find(params[:likeable_id])
    current_user.like!(@likeable)
  end

  def unlike
    @likeable = Video.find(params[:likeable_id])
    current_user.unlike!(@likeable)
  end

end
