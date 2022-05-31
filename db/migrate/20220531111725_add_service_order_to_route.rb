class AddServiceOrderToRoute < ActiveRecord::Migration[7.0]
  def change
    add_reference :routes, :service_order, null: false, foreign_key: true
  end
end
