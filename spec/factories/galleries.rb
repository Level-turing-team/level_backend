FactoryBot.define do
  factory :gallery do
    name { Faker::Quote.famous_last_words }
    user_google_id { Faker::Number.number(digits: 12) }
  end
end
