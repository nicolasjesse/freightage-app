class Company < ApplicationRecord
  has_many :prices
  has_many :delivery_times
  validates :brand_name, :corporate_name, :email_domain, :cnpj, :address, presence: true
  validates :brand_name, :corporate_name, :email_domain, :cnpj, uniqueness: true
  validates :cnpj, length: { is: 18 }
end
