class PurchaseOrder < ApplicationRecord
  before_create :generate_order_number

  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: :all_blank
  belongs_to :payment_term
  belongs_to :supplier
  enum :status, { pending: 0, shipped: 1, delivered: 2, cancelled: 3 }

  def generate_order_number
    year = Date.today.year

    last_order = PurchaseOrder.where("order_number LIKE ?", "PO-#{year}-%")
                      .order(created_at: :desc)
                      .first

    if last_order.nil?
      next_sequence = 1
    else
      last_sequence = last_order.order_number.split("-").last.to_i
      next_sequence = last_sequence + 1
    end

    formatted_sequence = sprintf("%03d", next_sequence)

    self.order_number = "PO-#{year}-#{formatted_sequence}"
  end

  # Método para calcular el subtotal (suma de todos los totales de los items)
  def subtotal
    order_items.sum(&:total_amount)
  end

  # Método para calcular el IVA (asumiendo un 19% en este ejemplo)
  def tax_amount
    subtotal * 0.16
  end

  # Método para calcular el total
  def total
    subtotal + tax_amount
  end
end
