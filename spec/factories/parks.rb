FactoryGirl.define do
  factory :park do
    sequence(:user_id) { |n| n }
    sequence(:title) { |n| "park no. #{n}!" }
    sequence(:location) { |n| "Location#{n}!" }
    rating 10
    bathroom true
    picnic true
    pets true
    basketball true
    baseball true
    user

    factory :park_with_reviews do
      after(:create) do |new_park|
        FactoryGirl.create(:review, park: new_park)
      end
    end
  end
end
