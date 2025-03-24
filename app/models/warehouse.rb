class Warehouse < ApplicationRecord
  has_many :product_stocks

  validates :name, presence: true, format: {
    with: /\A[a-zA-Z0-9\s]+\z/,
    message: :invalid
  }
  validates :location, presence: true

  def ocupacity_percentage
    # Obtener el total de stock
    total_stock = product_stocks.sum(:quantity) || 0

    # Obtener la capacidad del warehouse directamente desde el modelo
    ((total_stock.to_f / capacity) * 100).round(2)
  end
end
