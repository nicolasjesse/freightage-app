class DeliveryTime < ApplicationRecord
  belongs_to :company
  validates :min_distance, :max_distance, :days, presence: true
  validates :min_distance, :max_distance, :days, comparison: { greater_than_or_equal_to: 0 }
end
