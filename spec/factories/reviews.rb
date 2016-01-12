FactoryGirl.define do
  factory :review do
    sequence(:title) { |n| "review no. #{n}" }
    sequence(:body) { |n| "body no .#{n}" }
    rating 5
    user
    park
  end
end
