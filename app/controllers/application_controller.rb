class ApplicationController < ActionController::API
  def authenticate_user
    unless request.headers['Authorization'].present?
      render json: { message: 'Authorization token missing' }, status: :unprocessable_entity and return
    end
    headers = request.headers['Authorization']
    decoded = JsonWebToken.decode headers
    create_current_user(decoded)
  end

  private
  
  def create_current_user(decoded_token)
    id = decoded_token[0]['id']
    @current_user = User.find(id)
  end
end
