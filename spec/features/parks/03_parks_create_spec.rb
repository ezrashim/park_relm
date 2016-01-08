require "rails_helper"

# As an authenticated user
# I want to add an item
# So that others can review it

feature "authenticated users can view parks" do
  let!(:user) {create(:user)}
  scenario "visitor signs in and views parks on index page" do

    visit root_path

    sign_in_as(user)

    click_link("New Park")
    
    fill_in("Title", with: "Central Park")
    fill_in("Location", with: "NYC")

    click_button("Create Park")

    expect(page).to have_content("Central Park")
    expect(page).to have_content("NYC")
  end
end
