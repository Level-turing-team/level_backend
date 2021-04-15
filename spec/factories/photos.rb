FactoryBot.define do
  factory :photo do
    description { Faker::Lorem.sentence(word_count: 8) }
    Gallery
  end
end
