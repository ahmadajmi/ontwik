class SessionsController < ApplicationController

  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth = request.env["omniauth.auth"]
    speaker = Speaker.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || Speaker.create_with_omniauth(auth)
    reset_session
    session[:speaker_id] = speaker.id
    redirect_to current_user, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
