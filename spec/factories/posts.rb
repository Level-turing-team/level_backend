FactoryBot.define do
  factory :post do
    content { Faker::Lorem.paragraph }
    link { Faker::Internet.url }
    User
  end
end
