FactoryGirl.define do
  factory :vote do
    vote 0
    user
    review
  end
end
