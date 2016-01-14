FactoryGirl.define do
  factory :review do
    sequence(:title) { |n| "Awesome #{n}" }
    sequence(:body) { |n| "Could be better #{n}" }
    user
    park
  end
end
