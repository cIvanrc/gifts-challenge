# frozen_string_literal: true

# Handles the User authentication and generate the JWT
class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: user_params[:email])
    render json: { token: JsonWebToken.encode(sub: user.id) }, status: :created
  rescue
    render json: { errors: ['Invalid email or password'] }, status: :unauthorized
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
