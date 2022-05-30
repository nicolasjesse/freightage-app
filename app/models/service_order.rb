class ServiceOrder < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :price, optional: true
  has_many :vehicles

  enum status: { reproved: 3, finished: 2, approved: 1, pending: 0 }

  before_create :generate_code, :calculate_cost

  private

  def calculate_cost
    self.cost = price.value_by_km * distance
  end

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end
end
