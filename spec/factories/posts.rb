FactoryBot.define do
  factory :post do
    user_id { Faker::Number.number(digits: 3)}
    content { Faker::Lorem.paragraph }
    link { Faker::Internet.url }
  end
end
