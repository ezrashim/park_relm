require "rails_helper"
#
# I want to view a list of 10+ parks
# So that I can see only 10 items per page

feature "users can view parks" do
  let! (:parks) { create_list(:park_with_reviews, 25) }
  scenario "visitor signs in and views parks on index page" do
    park_list = parks.sort_by { |park| park.rating }
    visit root_path

    expect(page).to have_content park_list.last.title
    expect(page).to_not have_content park_list.first.title
  end
end
