class PaymentTerm < ApplicationRecord
  has_many :purchase_orders

  scope :active, -> { where(active: true) }
end
