require "rails_helper"

# As an authenticated user
# I want to delete park
# So that I nonbody can review them

feature "authorized user can delete park information" do
  scenario "admin signs in, navigated to edits page and deletes park" do
    park = FactoryGirl.create_list(:park, 1)
    visit park_path(park)
    click_link("Delete")
    expect(page).to have_content("You have deleted park successfully!")
  end
end
