require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Doe')
    fill_in('Email', with: 'johndoe@123.com')
    fill_in('Enter Password', with: 'Seekrit123')
    fill_in('Confirm Password', with: 'Seekrit123')
    attach_file "Profile Photo", "#{Rails.root}/spec/support/images/photo.png"
    click_button('Sign Up')

    expect(page).to have_content("Welcome! Thank you for signing up.")
    expect(page).to have_css("img[src*='photo.png']")
  end
end
