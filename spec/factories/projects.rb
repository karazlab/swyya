FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    image_url { Faker::Internet.url }
    github_link { Faker::Internet.url }
    user { user }
  end
end
