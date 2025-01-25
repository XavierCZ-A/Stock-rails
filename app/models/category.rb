class Category < ApplicationRecord
  #Associations
  has_many :products, dependent: :destroy
end
