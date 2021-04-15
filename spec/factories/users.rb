FactoryBot.define do
  factory :user do
    user_name { Faker::TvShows::TheExpanse.character }
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name }
    google_id { Faker::Number.number(digits: 12) }
    zipcode { Faker::Number.number(digits: 5) }
    User
  end
end
