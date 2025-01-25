class Product < ApplicationRecord
  has_many :product_sizes, dependent: :destroy
  has_many :sizes, through: :product_sizes

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
