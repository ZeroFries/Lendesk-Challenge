class AuthenticationController < ApplicationController
  def create
    user = User.where(username: params[:username]).first

    if user && BCrypt::Password.new(user.password) == params[:password]
      render nothing: true
    else
      render json: { error: 'Invalid username or password' }, status: 401
    end
  end
end
