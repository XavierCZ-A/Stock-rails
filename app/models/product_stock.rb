class ProductStock < ApplicationRecord
  belongs_to :product


  scope :total_stock, -> { sum(:quantity) }

  # def self.total_stock
  #   sum(:quantity)
  # end
  #
  # def self.total_stock_by_product(product_id)
  #   where(product_id: product_id).sum(:quantity)
  # end
  #
  # def self.total_stock_by_category(category_id)
  #   joins(product: :category).where(categories: { id: category_id }).sum(:quantity)
  # end
  #
  # def self.total_stock_by_category_name(category_name)
  #   joins(product: :category).where(categories: { name: category_name }).sum(:quantity)
  # end
  #
  # def self.total_stock_by_product_name(product_name)
  #   joins(:product).where(products: { name: product_name }).sum(:quantity)
  # end
  #
  # def self.total_stock_by_product_name_and_category_name(product_name, category_name)
  #   joins(product: :category).where(products: { name: product_name }, categories: { name: category_name }).sum(:quantity)
  # end
  #
  # def self.total_stock_by_product_id_and_category_id(product_id, category_id)
  #   joins(product: :category).where(products: { id: product_id }, categories: { id: category_id }).sum(:quantity)
  # end
  #
  # def self.total_stock_by_product_id(product_id)
  #   where(product_id: product_id).sum(:quantity)
  # end
  #
  # def self.total_stock_by_category_id(category_id)
  #   joins
  # end
end
