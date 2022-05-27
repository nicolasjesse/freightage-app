class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.decimal :min_product_volume
      t.decimal :max_product_volume
      t.decimal :min_product_weight
      t.decimal :max_product_weight
      t.decimal :value_by_km
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
