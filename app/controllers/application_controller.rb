class ApplicationController < ActionController::API
  def authenticate_user
    unless request.headers['Authorization'].present?
      render json: { message: 'Authorization token missing' }, status: :unprocessable_entity and return
    end
    headers = request.headers['Authorization']
    decoded = JsonWebToken.decode headers
  end
end
