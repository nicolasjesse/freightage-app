class ServiceOrdersController < ApplicationController
  def show
    @service_order = ServiceOrder.find(params[:id])
  end

  def index
    if current_user.user_type == 'admin'
      @service_orders = ServiceOrder.all
    else
      @service_orders = ServiceOrder.where('company_id = ?', current_user.company.id)
    end
  end

  def create
    service_order = ServiceOrder.create!(product_height: params[:height], product_width: params[:width],
                         product_depth: params[:depth], product_weight: params[:weight],
                         company: Company.find(params[:company]), price: Price.find(params[:price]),
                         distance: params[:distance])
    return redirect_to edit_service_order_path(service_order)
  end

  def edit
    @service_order = ServiceOrder.find(params[:id])
  end

  def update
    @service_order = ServiceOrder.find(params[:id])
    service_order_params = params.require(:service_order).permit(:product_address,
                          :product_code, :recipient_id, :recipient_address, :recipient_name)
    if @service_order.update(service_order_params)
      flash.now[:notice] = I18n.t("flashes.service_order_create_success")
      return redirect_to service_order_path(@service_order)
    else
      flash.now[:notice] = I18n.t("flashes.service_order_create_error")
      render 'edit'
    end
  end
end