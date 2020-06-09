class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: {message: 'Invalid credentials.'}, status: 400
    end
  end
end