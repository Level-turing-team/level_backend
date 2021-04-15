FactoryBot.define do
  factory :circle do
    user_id  { Faker::Number.number(digits: 3) }
    following_id { Faker::Number.number(digits: 3) }
  end
end
