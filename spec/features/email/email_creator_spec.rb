require "rails_helper"
#
# As a park creator, I want to receive an email
# whenever a new review is posted on a park that I created

feature "park creator recieves email when new review is posted" do
  let!(:user) { create(:user) }
  let!(:park) { create(:park_with_reviews) }
  scenario "Email sent if someone reviews a park successfully" do

    visit root_path
    sign_in_as(user)

    click_link (park.title)

    expect(page).to have_content(park.title)
    expect(page).to have_content(park.reviews.first.title)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
