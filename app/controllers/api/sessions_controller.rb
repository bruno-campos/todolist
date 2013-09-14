class Api::SessionsController < Api::ApiController

  def create
    @user = User.find_by(login: params[:login])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: {success: true, user: @user}
    else
      render json: {success: false, error: "Invalid e-mail or password"}
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {success: true}
  end

end