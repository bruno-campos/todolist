class Api::SessionsController < Api::ApiController

  def index
    if user_signed_in?
      respond_with current_user
    else
      render json: {user_signed_in: "false"}, status: :not_found
    end
  end

  def create
    @user = User.find_by(login: params[:login])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: {success: true, user: @user}
    else
      render json: {success: false, message: "Invalid e-mail or password"}, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {success: true}
  end

end