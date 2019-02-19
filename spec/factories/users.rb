FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    description { Faker::Lorem.sentence }
    password { SecureRandom.urlsafe_base64 }
    email { Faker::Internet.email }
  end
end
