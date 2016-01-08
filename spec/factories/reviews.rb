FactoryGirl.define do
  factory :review do
    sequence(:title) { |n| "park no. #{n}" }
    sequence(:body) { |n| "body no .#{n}"}
    user
    park
  end
end
