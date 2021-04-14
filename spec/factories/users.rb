FactoryBot.define do
  factory :user do
    profile_name { Faker::TvShows::TheExpanse.character }
    zipcode { Faker::Number.number(digits: 5) }
    User
  end
end
