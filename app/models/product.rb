class Product < ApplicationRecord
  has_many :product_sizes, dependent: :destroy
  has_many :sizes, through: :product_sizes
end
