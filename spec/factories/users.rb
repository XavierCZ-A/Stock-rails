FactoryBot.define do
  factory :user do
    email { "test@gmail.com" }
    name { "xavier" }
    last_name { "caballero" }
    password { "SecretPassword" }
  end
end
