class Api::V1::UserController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.update(api_key: SecureRandom.hex)
      render json: UsersSerializer.new(user), status: 201
    else
      render json: user.errors, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end