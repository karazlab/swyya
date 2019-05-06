FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    user { user }
    idea { idea }
  end
end
