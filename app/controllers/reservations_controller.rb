class ReservationsController < ApplicationController
  before_action :current_user
  authorize_resource

  def index
    @user_reservations = Reservation.where(user_id: current_user.id)
    render json: @user_reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      render json:
      { message: 'Reservation successfully created', reservation: @reservation }, status: :created, location: @resort
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_from, :date_to, :resort_id)
  end
end
