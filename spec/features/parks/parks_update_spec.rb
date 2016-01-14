require "rails_helper"

# As an authenticated user
# I want to update an item's information
# So that I can correct errors or provide new information

feature "authenticated users can edit park information" do
  scenario "visitor signs in and views parks and navigated to edits page" do
    park = create_list(:park, 3)
    visit park_path(park.first.id)
    click_link("Update")

    expect(page).to have_content("Bathroom")
    expect(page).to have_content("Picnic Area")
    expect(page).to have_field('Title', with: "#{park.first.title}")
    expect(page).to have_field('Location', with: "#{park.first.location}")
  end

  scenario "visitor edits park information and submits changes" do
    park = FactoryGirl.create_list(:park, 3)

    visit edit_park_path(park.first)

    fill_in("Title", with: "Central Park")
    fill_in("Location", with: "NYC")
    click_button("Update Park")

    expect(page).to have_content("Central Park")
    expect(page).to have_content("NYC")
  end
end
