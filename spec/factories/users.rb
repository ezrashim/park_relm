FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johnsmith#{n}@gmail.com" }
    password "password"
    password_confirmation "password"
  end
end
