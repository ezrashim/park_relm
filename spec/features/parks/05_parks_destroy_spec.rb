require "rails_helper"

# As an authenticated user
# I want to delete park
# So that I nonbody can review them

feature "authorized user can delete park information" do
  let(:park) { create :park }
  let(:admin) { create :user, role: "admin" }
  let(:user) { create :user }


  scenario "admin signs in, navigated to edits page and deletes park" do

    visit root_path
    sign_in_as(admin)

    visit park_path(park)
    click_link("Delete")
    expect(page).to have_content("You have deleted park successfully!")
  end

  scenario "member signs in, should be unable to delete park" do

    visit root_path
    sign_in_as(user)

    visit park_path(park)
    expect(page).to_not have_content("Delete")
  end

end
