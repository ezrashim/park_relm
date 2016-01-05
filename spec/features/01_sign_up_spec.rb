require 'rails_helper'
require 'launchy'

feature 'sign up', %Q{
  As a prospective user
  I want to create an account
  So that I can post items and review them
  } do
    # ACCEPTANCE CRITERIA
    # * I must specify a valid email address
    # * I must specify a password, and confirm that password
    # * If I do not perform the above, I get an error message
    # * If I specify valid information, I register my account and am authenticated

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Doe')
    fill_in('Email', with: 'johndoe@123.com')
    fill_in('Enter Password', with: 'Seekrit')
    fill_in('Confirm Password', with: 'Seekrit')
    fill_in('Profile Picture', with: 'http://s3.amazonaws.com/37assets/svn/765-default-avatar.png')
    click_button('Sign Up')

    expect(page).to have_content("You have successfully signed in.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Enter Password', with: 'Seekrit'
    fill_in 'Confirm Password', with: 'Seekrit'

    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end
end
