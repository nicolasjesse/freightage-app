class PricesController < ApplicationController
  def search
    volume = params[:height].to_d * params[:width].to_d * params[:depth].to_d
    weight = params[:weight]
    @distance = params[:distance].to_d
    @prices = Price.where('min_product_weight <= ? AND max_product_weight >= ?
                           AND min_product_volume <= ? AND max_product_volume >= ?',
                           weight, weight, volume, volume)
  end
end