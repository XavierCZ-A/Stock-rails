class Supplier < ApplicationRecord
  has_many :supplier_contacts, dependent: :destroy
end
