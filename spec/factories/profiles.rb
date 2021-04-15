FactoryBot.define do
  factory :profile do
    user_id { Faker::Number.number(digits: 3)}
    zipcode { Faker::Address.zip[0..4]}
    profile_picture { Faker::Internet.url }
  end
end
