class Price < ApplicationRecord
  belongs_to :company
  validates :min_product_volume, :max_product_volume, :min_product_weight,
            :max_product_weight, :value_by_km, presence: true
  validates :min_product_volume, :max_product_volume, :min_product_weight,
            :max_product_weight, :value_by_km, comparison: { greater_than_or_equal_to: 0 }
end
