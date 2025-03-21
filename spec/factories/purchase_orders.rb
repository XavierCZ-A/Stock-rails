FactoryBot.define do
  factory :purchase_order do
    quantity { 1 }
    delivery_date { "2025-02-26" }
    status { 1 }
    price { "9.99" }
    product { "MyString" }
    supplier { nil }
  end
end
