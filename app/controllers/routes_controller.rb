class RoutesController < ApplicationController
  before_action :authenticate_user!, except: [:track]
  def new
    @service_order = ServiceOrder.find(params[:service_order_id])
    @route = Route.new
  end

  def create
    route_params = params.require(:route).permit(:date_time, :latitude, :longitude)
    route = Route.new(route_params) 
    route.service_order_id = params[:service_order_id]
    if route.save!
      flash[:notice] = I18n.t("flashes.route_create_success")
    else
      flash[:notice] = I18n.t("flashes.route_create_error")
    end
    redirect_to service_order_path(params[:service_order_id])      
  end

  def track
    if params[:commit]
      service_order = ServiceOrder.find_by(code: params[:code])
      if service_order
        @routes = service_order.routes
      else
        @routes = []
        flash.now[:notice] = I18n.t("flashes.track_code_doesnt_exist")
      end
    else
      @routes = []
    end
  end
end