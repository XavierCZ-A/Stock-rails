class Supplier < ApplicationRecord
  has_many :supplier_contacts, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy

  validates :company_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: :invalid
  }
  validates :name, presence: true, length: { minimum: 3 }, format: {
    with: /\A[a-zA-Z\s]+\z/,
    message: :invalid
  }
  validates :phone, presence: true, length: { maximum: 10 }, numericality: true
  validates :address, presence: true
end
