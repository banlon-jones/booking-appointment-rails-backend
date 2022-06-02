require_relative '../services/jwt_auth'

class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  def authenticate_user
    unless request.headers['Authorization'].present?
      render json: { message: 'Authorization token missing' }, status: :unprocessable_entity and return
    end

    headers = request.headers['Authorization']
    decoded = JwtAuthService.decode headers
    create_current_user(decoded)
  end

  private

  def create_current_user(decoded_token)
    id = decoded_token[0]['id']
    @current_user = User.find(id)
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :name, :email,
        :password_confirmation, :password
      )
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :name, :email,
        :password_confirmation, :password, :current_password
      )
    end
  end
end
