require "rails_helper"
#
# I want to view a list of items
# So that I can pick items to review

# TO DO : As an authenticated user

feature "users can find items using search bar" do

  scenario "visitor can see search bar on index page" do
    visit root_path

    expect(page).to have_selector("input[type=submit][value='Search']")
  end

  scenario "searches and finds an item" do
    parks = create_list(:park_with_reviews, 2)
    visit root_path
    fill_in 'search', with: "#{parks.first.title}"
    click_button 'Search'

    expect(page).to have_content(parks.first.title)
  end

  scenario "searches for nonexistent item and gets empty results page" do
    parks = create_list(:park_with_reviews, 2)
    visit root_path
    fill_in 'search', with: "@@@"
    click_button 'Search'

    expect(page).to have_content("No results found!")
    expect(page).to_not have_content(parks.first.title)
  end
end
