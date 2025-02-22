class SupplierContact < ApplicationRecord
  belongs_to :supplier

  validates :name, presence: true, length: { minimum: 3 }, format: {
    with: /\A[a-zA-Z]+\z/,
    message: :invalid
  }
  validates :last_name, presence: true, length: { minimum: 3 }, format: {
    with: /\A[a-zA-Z]+\z/,
    message: :invalid
  }
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: :invalid
  }
  validates :phone, presence: true
  validates :supplier_id, presence: true
end
