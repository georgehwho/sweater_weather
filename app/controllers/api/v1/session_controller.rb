class Api::V1::SessionController < ApplicationController
  def create
    credentials = user_params
    user = User.find_by(email: credentials[:email])

    if user && user.authenticate(credentials[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: { error: 'Something went wrong' }, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end