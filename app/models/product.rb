class Product < ApplicationRecord
  include PgSearch::Model

  has_many :product_sizes, dependent: :destroy
  has_many :sizes, through: :product_sizes
  belongs_to :category
  has_one :product_stock, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true

  pg_search_scope :search_full_text, against: {
    name: 'A',
  }

  scope :total_products_price, -> { sum(:price) }
end
