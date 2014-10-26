FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words.join(" ") }
    content { Faker::Lorem.paragraphs.join("\n") }
    user
  end
end
