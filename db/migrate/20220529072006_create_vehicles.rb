class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :brand
      t.string :model
      t.string :year_of_fabrication
      t.decimal :capacity

      t.timestamps
    end
  end
end
