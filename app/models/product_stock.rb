class ProductStock < ApplicationRecord
  after_save :check_stock_level

  belongs_to :product
  has_many :notifications

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :total_stock, -> { sum(:quantity) }

  def low_stock?
    quantity < min_stock
  end

  def notificated?
    notification_stock
  end

  def check_stock_level
    puts "🔥 Verificando stock bajo..."  # Esto se imprimirá en Rails Console
    if notificated?
      puts "🔥 Verificando si acepta notificaciones..."
      if low_stock?
        puts "⚠️ ¡Stock bajo detectado! Creando notificación..."
        Notification.create(
          product_stock: self,
          message: "¡Alerta! El producto #{product.name} tiene un stock bajo (#{quantity} unidades)"
        )
      end
    end
  end
end
