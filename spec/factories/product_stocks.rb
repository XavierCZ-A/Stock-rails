FactoryBot.define do
  factory :product_stock do
    quantity { 1 }
    association :product
  end
end
