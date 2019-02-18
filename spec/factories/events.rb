FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    start_date { "2019-02-11 13:34:50" }
    duration { 1 }
    price { 1 }
    location { "MyString" }
  end
end
