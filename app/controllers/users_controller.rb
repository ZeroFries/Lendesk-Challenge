class UsersController < ApplicationController
  def create
    result = CreateUser.call user_params

    if result.success?
      render json: {
        user: {
          username: result.user.username
        }
      }
    else
      render json: { error: result.error }, status: 500
    end
  end

  def login
    user = User.where(username: params[:username]).first

    if user && BCrypt::Password.new(user.password) == params[:password]
      render nothing: true
    else
      render json: { error: 'Invalid username or password' }, status: 401
    end
  end

  protected

  def user_params
    params.require(:user).permit :username, :password
  end
end
