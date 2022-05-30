class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.datetime :date_time
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
