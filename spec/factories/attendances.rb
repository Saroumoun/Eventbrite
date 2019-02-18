FactoryBot.define do
  factory :attendance do
    stripe_customer_id { SecureRandom.urlsafe_base64 }
  end
end
