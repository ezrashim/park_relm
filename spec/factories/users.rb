FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    sequence(:first_name) { |n| "Relm#{n}" }
    sequence(:last_name) { |n| "Park#{n}" }
    admin false
    avatar_url "http://2.bp.blogspot.com/-HzFJhEY3KtU/Tea7Ku92cpI/AAAAAAAAALw/uBMzwdFi_kA/s400/1.jpg"
  end

end
