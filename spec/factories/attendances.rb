FactoryBot.define do
  factory :attendance do
    stripe_customer_id { SecureRandom.urlsafe_base64 }
    attendee { FactoryBot.create(:user) }
  	event { FactoryBot.create(:event) }
  end
end
