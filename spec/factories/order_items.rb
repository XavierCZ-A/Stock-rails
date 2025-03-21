FactoryBot.define do
  factory :order_item do
    purchaseOrder { nil }
    product { nil }
    quantity { 1 }
    price { "9.99" }
    total_amount { "9.99" }
  end
end
