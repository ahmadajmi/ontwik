class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :ensure_http_referer_is_set

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  # def ensure_http_referer_is_set
  #   request.env['HTTP_REFERER'] ||= ''
  # end

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
      # @profile = profile.friendly.find(params[:id])
      @profile = params[:id] ? Profile.friendly.find(params[:id]) : Profile.friendly.find(params[:nickname])
      unless current_user == @profile
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def authenticate_profile!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end

end
