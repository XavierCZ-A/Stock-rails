FactoryBot.define do
  factory :product do
    name { "T-shirt" }
    description { "Description T-shirt" }
    price { 25.50 }
    association :category
  end
end
