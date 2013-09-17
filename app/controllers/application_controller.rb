class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_signed_in?
    session[:user_id].present?
  end

  def current_user
    if @current_user.blank? && session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @current_user
  end
  helper_method :current_user

end
