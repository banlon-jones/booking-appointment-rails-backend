class ResortsController < ApplicationController
  before_action :current_user
  load_and_authorize_resource

  def index
    @resorts = Resort.all
    render json: @resorts
  end

  def show
    @resort = Resort.find(params[:id])
    render json: { resort: @resort }
  end

  def create
    @resort = Resort.new(resort_params)
    if @resort.save
      render json: { message: 'resorted created', resort: @resort }, status: :created
    else
      render json: @resort.errors, status: :unprocessable_entity
    end
  end

  def update
    @resort = Resort.find(params[:id])
    if @resort.update(resort_params)
      render json: { message: 'resort successfully updated', resort: @resort }, status: :ok
    else
      render json: @resort.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @resort = Resort.find(params[:id])
    @resort.delete
  end

  private

  def resort_params
    params.require(:resort).permit(:name, :city, :country, :image, :description, :cost)
  end
end
