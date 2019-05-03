FactoryBot.define do
  factory :idea do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    user { user }
  end
end
