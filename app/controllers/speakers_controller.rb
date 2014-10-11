class SpeakersController < ApplicationController
  before_filter :authenticate_speaker!, except: [:show]
  before_filter :correct_user?, :only => :edit

  def index
    @speakers = Speaker.all
  end

  def show
    @speaker = Speaker.friendly.find(params[:id])
  end

  def edit
    @speaker = Speaker.friendly.find(params[:id])
  end

  def update
    @speaker = Speaker.friendly.find(params[:id])

    if @speaker.update(speaker_params)
      redirect_to @speaker, :notice => 'Successfully updated your profile.'
    else
      render 'edit'
    end
  end

  def follow
    @speaker = Speaker.friendly.find(params[:speaker])
    current_user.toggle_follow!(@speaker)
  end

  def unfollow
    @speaker = Speaker.friendly.find(params[:speaker])
    current_user.unfollow!(@speaker)
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
    def speaker_params
      params.require(:speaker).permit(:name, :profile_banner, :description)
    end

end
