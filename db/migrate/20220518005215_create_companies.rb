class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :corporate_name
      t.string :brand_name
      t.string :email_domain
      t.string :cnpj
      t.string :address
      t.boolean :active

      t.timestamps
    end
  end
end
