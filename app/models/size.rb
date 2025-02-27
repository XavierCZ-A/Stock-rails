class Size < ApplicationRecord
  has_many :product_sizes, dependent: :destroy
  has_many :products, through: :product_sizes
end
