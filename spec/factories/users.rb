FactoryBot.define do
  factory :user do
    user_name { Faker::TvShows::TheExpanse.character }
    first_name { Faker::TvShows::TheExpanse.character }
    last_name { Faker::TvShows::TheExpanse.character }
    google_id { Faker::Number.number(digits: 12) }
    zipcode { Faker::Number.number(digits: 5) }
    User
  end
end
