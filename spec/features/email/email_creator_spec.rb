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

    click_link("New Park")
    fill_in("Title", with: "Central Park")
    fill_in("Location", with: "NYC")

    click_button("Create Park")
    visit park_path(park)
    click_link (park.title)

    fill_in("Title", with: "Awesome park")
    fill_in("Body", with: "I can go to this park anytime of the year")
    select "10", from: "Rating"
    click_button ("Create Review")

    expect(page).to have_content("Awesome park")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
