FactoryBot.define do
  factory :profile do
    user_id { Faker::Number.unique.number(digits: 5) }
    zipcode { Faker::Address.zip[0..4] }
    profile_picture { Faker::Internet.url }
  end
end
