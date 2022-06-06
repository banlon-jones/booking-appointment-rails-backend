require_relative '../services/jwt_auth'

class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :unauthorized
  end
  rescue_from JWT::VerificationError do |_e|
    render json: { error: 'Invalid Token' }, status: :unauthorized
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  rescue_from ActionController::ParameterMissing do |e|
    render json: { error: e.message }, status: :bad_request
  end

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
