class Supplier < ApplicationRecord
  has_many :supplier_contacts, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy
end
