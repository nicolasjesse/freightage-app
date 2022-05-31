class PricesController < ApplicationController
  before_action :authenticate_user!
  def search
    @volume = params[:height].to_d * params[:width].to_d * params[:depth].to_d
    @weight = params[:weight]
    @distance = params[:distance].to_d
    @prices = Price.where('min_product_weight <= ? AND max_product_weight >= ?
                           AND min_product_volume <= ? AND max_product_volume >= ?',
                           @weight, @weight, @volume, @volume)
  end

  def new
    @company = Company.find(params[:company_id])
    @price = Price.new
  end

  def create
    price_params = params.require(:price).permit(:min_product_volume, :max_product_volume,
                                                 :min_product_weight, :max_product_weight,
                                                 :value_by_km)
    price = Price.new(price_params) 
    price.company_id = params[:company_id]
    price.save!
    redirect_to company_path(params[:company_id])                                                    
  end
end