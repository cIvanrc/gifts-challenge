class ApplicationController < ActionController::API
  before_action :set_default_format
  before_action :authenticate_user!

  private
  def set_default_format
    request.format = :json
  end

  def authenticate_user!
    payload = JsonWebToken.decode(auth_token)
    @current_user = User.find(payload['sub'])
  rescue JWT::DecodeError
    render json: { errors: ['invalid auth token'] }, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch('Authorization', '').split(' ').last
  end
end
