FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words.join(" ") }
    content { Faker::Lorem.paragraphs.join("\n") }
    published_at { 1.hour.ago }
    user
  end
end
