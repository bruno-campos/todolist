class Api::UsersController < Api::ApiController

  def index
  end

  def create
    @user = User.new(user_params)
    #if @user.save
    #  render json: {success: true, user: @user}
    #else
    #  render json: {success: false, user: @user, errors: @user.errors}
    #end
    @user.save
    respond_with :api, @user
  end

  private

  def user_params
    params.require(:user).permit(:login, :name, :password, :password_confirmation)
  end

end