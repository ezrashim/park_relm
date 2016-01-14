require "rails_helper"
#
# As a park creator, I want to receive an email
# whenever a new review is posted on a park that I created

feature "park creator recieves email when new review is posted" do


  scenario "Email sent if someone reviews a park successfully" do
    user = create(:user)

    sign_in_as(user)
    click_link ('New Park')

    fill_in "Title", with: "Central Park"
    fill_in "Location", with: "NYC"

    click_button ('Create Park')
    click_link ("Central Park")

    fill_in "Title", with: "Love this park"
    select 10, from: 'Rating'
    fill_in "Body", with: "This park is great for walks"
    click_button "Create Review"

    expect(page).to have_content("Central Park")
    expect(page).to have_content("Love this park")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
