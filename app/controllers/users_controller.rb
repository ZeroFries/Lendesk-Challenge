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

  protected

  def user_params
    params.require(:user).permit :username, :password
  end
end
