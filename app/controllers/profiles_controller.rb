class ProfilesController < ApplicationController
  before_action :authenticate_profile!, except: [:show, :index]
  before_action :correct_user?, :only => :edit
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :set_darker_background, only: [:edit, :update]
  def index
    @profiles = Profile.all
    redirect_to root_url
  end

  def show
    @profileTalks = @profile.talks.order('created_at DESC').all
    @followers = @profile.followers(Profile)
    @following = @profile.followees(Profile)
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_url(@profile), notice: t('profile_successfully_updated')
    else
      render 'edit'
    end
  end

  def follow
    @profile = Profile.friendly.find(params[:profile])
    current_user.toggle_follow!(@profile)
  end

  def unfollow
    @profile = Profile.friendly.find(params[:profile])
    current_user.unfollow!(@profile)
  end

  def like
    @likeable = Talk.find(params[:likeable_id])
    current_user.like!(@likeable)
  end

  def unlike
    @likeable = Talk.find(params[:likeable_id])
    current_user.unlike!(@likeable)
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :profile_banner, :description)
  end

  def set_profile
    @profile = Profile.friendly.find(params[:id])
  end
end