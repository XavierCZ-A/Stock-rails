require 'csv'

class Product < ApplicationRecord
  include PgSearch::Model

  has_many :product_sizes, dependent: :destroy
  has_many :sizes, through: :product_sizes
  has_many :order_items, dependent: :destroy
  has_many :purchase_orders, through: :order_items
  belongs_to :category
  belongs_to :user, default: -> { Current.user }
  has_one :product_stock, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true

  pg_search_scope :search_full_text, against: {
    name: 'A',
  }

  scope :total_products_price, -> { sum(:price) }
  scope :order_by_date, -> { order(created_at: :desc) }
  scope :for_user, ->(user) { where(user_id: user.id) }


  def self.to_csv
    products = all.includes(:category)
    CSV.generate(headers: true) do |csv|
      headers = column_names - ['category_id'] + ['category_name']
      csv << headers
      products.each do |product|
        values = product.attributes.except('category_id').values
        values << product.category&.name
        csv << values
      end
    end
  end
end
