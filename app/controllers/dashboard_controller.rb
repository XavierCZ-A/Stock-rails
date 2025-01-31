class DashboardController < ApplicationController
  layout "product"
  def index
    @total_products_price = Product.total_products_price
    @total_stock = ProductStock.total_stock
    @products = Product.all
  end
end
