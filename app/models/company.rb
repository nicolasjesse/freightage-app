class Company < ApplicationRecord
  has_many :prices
  has_many :delivery_times
  has_many :users
  validates :brand_name, :corporate_name, :email_domain, :cnpj, :address, presence: true
  validates :brand_name, :corporate_name, :email_domain, :cnpj, uniqueness: true
  validates :cnpj, length: { is: 18 }

  def get_delivery_time(distance)
    delivery_times = self.delivery_times.where('? > min_distance AND ? < max_distance', distance, distance)
    if delivery_times.any?
      delivery_times[0].days
    else
      'Not available'
    end
  end
end
