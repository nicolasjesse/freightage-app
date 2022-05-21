class Company < ApplicationRecord
  validates :brand_name, :corporate_name, :email_domain, :cnpj, :address, presence: true
end
