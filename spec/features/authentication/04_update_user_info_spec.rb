require 'rails_helper'

feature 'update user information', %{
  As an unauthenticated user
  I want to update my information
  So that I can keep my profile up to date
  } do
    # ACCEPTANCE CRITERIA
    # * I can update a user's email address
    # * I can update a user's password
    # * I can update first and last names
    # * I can update profile picture

  scenario 'an existing user updates first and last names' do
    user = create(:user)
    visit root_path
    sign_in_as(user)
    click_link user.email

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.avatar_url)
    click_button 'Update'

    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Lee')
    click_button 'Update'

    expect(page).to have_content('John')
    expect(page).to have_content('Lee')

    expect(page).to_not have_content(user.firt_name)
    expect(page).to_not have_content(user.last_name)
  end
end
