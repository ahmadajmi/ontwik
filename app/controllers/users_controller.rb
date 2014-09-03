class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    render :layout => 'userlayout'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
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

  private
  def user_params
    params.require(:user).permit(:name, :description)
  end

end
