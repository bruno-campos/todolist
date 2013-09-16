class Api::UsersController < Api::ApiController

  def index
  end

  def create
    @user = User.new(user_params)
    @user.save
    # Sign in user after creating it
    session[:user_id] = @user.id
    respond_with :api, @user
  end

  private

  def user_params
    params.require(:user).permit(:login, :name, :password, :password_confirmation)
  end

end