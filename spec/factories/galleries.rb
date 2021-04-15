FactoryBot.define do
  factory :gallery do
    name { Faker::Quote.famous_last_words }
    user_id { Faker::Number.number(digits: 3) }
  end
end
