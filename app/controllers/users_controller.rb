require_relative '../services/jwt_auth'

class UsersController < ApplicationController
  def login
    @user = User.find_by_email!(params[:email])
    if @user&.valid_password?(params[:password])
      token = JwtAuthService.encode({ id: @user.id })
      render json: token
    else
      render json: { error: 'Invalid login details' }, status: :unauthorized
    end 
  end
end