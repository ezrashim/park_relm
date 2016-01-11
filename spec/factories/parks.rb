FactoryGirl.define do
  factory :park do
    # association :review
    sequence(:title) { |n| "park no. #{n}" }
    sequence(:location) { |n| "Location#{n}" }
    rating 10
  end
end
