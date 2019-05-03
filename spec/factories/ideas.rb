FactoryBot.define do
  factory :idea do
    title { "MyString" }
    description { "MyText" }
    status { 1 }
    user { nil }
  end
end
