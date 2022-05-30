class AddPriceBaseToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :base_price, :decimal
  end
end
