FactoryGirl.define do
  factory :park do
    sequence(:title) { |n| "park no. #{n}!" }
    sequence(:location) { |n| "Location#{n}" }

    factory :park_with_reviews do
      after(:create) do |new_park|
        FactoryGirl.create(:review, park: new_park)
      end
    end
  end
end
