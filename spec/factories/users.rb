FactoryBot.define do
  factory :user do
    email { "example@gmail.com" }
    name { "xavier" }
    last_name { "caballero" }
    password { "SecretPassword" }
  end
end
