class DeliveryTimesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.find(params[:company_id])
    @delivery_time = DeliveryTime.new
  end

  def create
    delivery_time_params = params.require(:delivery_time).permit(:min_distance, :max_distance, :days)
    delivery_time = DeliveryTime.new(delivery_time_params) 
    delivery_time.company_id = params[:company_id]
    delivery_time.save!
    redirect_to company_path(params[:company_id])
  end
end