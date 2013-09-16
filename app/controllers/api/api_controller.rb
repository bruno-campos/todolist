class Api::ApiController < ApplicationController

  protect_from_forgery with: :null_session

  prepend_before_filter :authenticate_user_from_api_key!
  before_filter :default_format_json

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from Exception,                    :with => :exception

  respond_to  :json
  layout      false

  def authenticate_user!
    unless current_user.present?
      render json: {success: false, message: "Invalid user data."}, status: :unauthorized
    end
  end

  private

  def authenticate_user_from_api_key!
    user_login = params[:user_login].presence
    user       = user_login && User.find_by(login: user_login)
    if user && user.api_key == params[:api_key]
      @current_user ||= User.find(user.id)
    end
  end

  def record_not_found
    render json: {error: "Resource not found."}, status: :not_found
  end

  def exception(ex)
    render json: {message: ex.message}, status: 500
  end

  def default_format_json
    request.format = :json
  end

end