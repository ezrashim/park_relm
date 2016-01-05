FactoryGirl.define do
  factory :user do
  #   encrypted_password
  #   reset_password_token
  #   reset_passowrd_sent_at
  #
  #   sequence(:first_name) { |n| "first#{n}"}
  #   sequence(:last_name) {|n| "last#{n}"}
  #   admin false
  sequence(:email) {|n| "hello#{n}@world.com"}
  #   sequence(:profile_url) {|n| "https://www.pic#{n}.com"}
  sequence(:password) {|n| "Seekrit#{n}#{n}#{n}#{n}"}
   end

end
#
# factory :park do
#   sequence(:title)  {|n| "park#{n}"}
#   sequence(:location) {|n| "place#{n}"}
#   rating 10
#   sequence(:description) { |n| "This park receives a rating of #{n} for no apparent reason."}
# end
# end
