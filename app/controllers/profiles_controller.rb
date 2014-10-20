class ProfilesController < ApplicationController
  before_filter :authenticate_profile!, except: [:show, :index]
  before_filter :correct_user?, :only => :edit

  def index
    @profiles = Profile.all
    redirect_to root_url
  end

  def show
    @profile = params[:id] ? Profile.friendly.find(params[:id]) : Profile.friendly.find(params[:nickname])
    @profileTalks = @profile.talks.order('created_at DESC').all
  end

  def edit
    @profile = params[:id] ? Profile.friendly.find(params[:id]) : Profile.friendly.find(params[:nickname])
  end

  def update
    @profile = Profile.friendly.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile, :notice => 'Successfully updated your profile.'
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

end
