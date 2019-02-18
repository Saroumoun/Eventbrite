FactoryBot.define do
  factory :event do
    title { Faker::Beer.name }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.forward(30) }
    duration { 5 * rand(1..10) }
    price { rand(1..1000) }
    location { Faker::Address.city }
    admin {FactoryBot.create(:user)}
  end
end
