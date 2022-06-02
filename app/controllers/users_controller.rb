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

  def signup
    if (params[:name].present? &&
       params[:email].present? &&
       params[:password].present? &&
       params[:password_confirmation].present?)
       if params[:password] == params[:password_confirmation]
        @user = User.create(allowed_params)
        render json: { success: 'Successfully signed up, you can now login' }, status: :created
       else
        render json: { error: 'Password missmatch' }, status: :conflict
      end
    else
      render json: { error: 'missing signup details' }, status: :partial_content
    end
  end

  private

  def allowed_params
    params.require( :user ).permit( :name, :email, :password, :password_confirmation)
  end
end
