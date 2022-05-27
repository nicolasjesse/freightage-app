class AddDefaultToActive < ActiveRecord::Migration[7.0]
  def change
    change_column :companies, :active, :boolean, :default => true
  end
end
