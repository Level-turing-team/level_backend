FactoryBot.define do
  factory :tag do
    name { Faker::Name.initials(5) }
  end
end
