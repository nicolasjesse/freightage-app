class ServiceOrder < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :price, optional: true
  belongs_to :vehicle, optional: true
  has_many :routes

  enum status: { disapproved: 3, finished: 2, approved: 1, pending: 0 }

  before_create :generate_code, :calculate_cost

  def is_approvable
    price_id && company_id && code && product_address && product_code &&
    product_height && product_width && product_depth && product_weight &&
    recipient_address && recipient_name && recipient_id && vehicle_id
  end
  
  private
  
  def calculate_cost
    self.cost = price.value_by_km * distance
  end
  
  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end
end
