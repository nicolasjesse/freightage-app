class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.string :code
      t.string :product_address
      t.string :product_code
      t.decimal :product_height
      t.decimal :product_width
      t.decimal :product_depth
      t.decimal :product_weight
      t.integer :status, :default => 0
      t.string :recipient_address
      t.string :recipient_name
      t.string :recipient_id
      t.decimal :cost
      t.references :company, null: true, foreign_key: true
      t.references :price, null: true, foreign_key: true

      t.timestamps
    end
  end
end
