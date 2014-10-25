FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "verysecret"
    password_confirmation "verysecret"
  end
end
