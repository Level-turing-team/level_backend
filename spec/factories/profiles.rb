FactoryBot.define do
  factory :profile do
    user_id { Faker::Number.number(digits: 3)}
    zipcode { Faker::Number.number(digits: 5)}
    profile_picture { Faker::Internet.url } 
  end
end
