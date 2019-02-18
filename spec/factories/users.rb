FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    description { "MyText" }
    encrypted_password { "MyString" }
    email { "MyString" }
  end
end
