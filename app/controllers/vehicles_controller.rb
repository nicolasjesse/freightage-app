class VehiclesController < ApplicationController
  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def index
    @vehicles = Vehicle.where('company_id = ?', params[:company_id])
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(brand: params[:brand], model: params[:model], plate: params[:plate], 
                           year_of_fabrication: params[:year_of_fabrication], capacity: params[:capacity],
                           company: current_user.company)
    if @vehicle.save
      flash[:notice] = I18n.t("flashes.vehicle_create_success")
      return redirect_to company_vehicles_path(current_user.company.id)
    else
      flash.now[:notice] = I18n.t("flashes.vehicle_create_error")
      render 'new'
    end
  end
end