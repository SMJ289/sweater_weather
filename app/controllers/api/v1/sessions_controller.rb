class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: :ok
    else
      render json: { message: 'Invalid credentials.' }, status: :bad_request
    end
  end
end
