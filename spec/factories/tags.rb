FactoryBot.define do
  factory :tag do
    name { Faker::Internet.user_name(5..8)[0..3] }
  end
end
