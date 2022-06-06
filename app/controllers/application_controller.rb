require_relative '../services/jwt_auth'

class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_e|
    render json: { message: 'You are not authorized to access this resource feature' }, status: :forbidden
  end

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

  def current_user
    return unless auth_token

    id = auth_token.first['id']
    User.find(id)
  end

  private

  def auth_token
    unless request.headers['Authorization'].present?
      render json: { error: 'Authorization token missing' }, status: :unprocessable_entity and return false
    end

    headers = request.headers['Authorization']
    JwtAuthService.decode headers
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
