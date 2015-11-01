class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :profile_url

  # Controllers can call this to add classes to the body tag
  def add_body_css_class(css_class)
    @body_css_classes ||= []
    @body_css_classes << css_class
  end

  private

  def current_user
    begin
      @current_user ||= Profile.find(session[:profile_id]) if session[:profile_id]
    rescue Exception => e
      nil
    end
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @profile = params[:id] ? Profile.friendly.find(params[:id]) : Profile.friendly.find(params[:nickname])
    unless current_user == @profile
      redirect_to root_url, alert: t('access_denied')
    end
  end

  def authenticate_profile!
    if !current_user
      redirect_to root_url, alert: t('login_to_access_message')
    end
  end

  def profile_url(profile)
    "/#{profile.nickname}"
  end

  def set_darker_background
    @page_has_darker_background = true
  end
end