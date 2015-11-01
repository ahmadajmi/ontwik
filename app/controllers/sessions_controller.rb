class SessionsController < ApplicationController

  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth = request.env['omniauth.auth']
    profile = Profile.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || Profile.create_with_omniauth(auth)
    reset_session
    session[:profile_id] = profile.id
    redirect_to current_user, notice: t('signed_in')
  end

  def destroy
    reset_session
    redirect_to root_url, notice: t('signed_out')
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end