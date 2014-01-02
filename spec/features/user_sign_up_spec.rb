require 'spec_helper'

feature 'user sign up' do
  scenario 'user provides all valid and required information' do
    visit '/'
    click_link 'Sign Up Here'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Watson'
    fill_in 'Email', with: 'john@watson.com'
    fill_in 'user_password', with: 'password' #used css selector user_password to disambiguate for capybara
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content('Success! Welcome to Simple Social!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'required info is missing' do
    visit '/'
    click_link 'Sign Up Here'
    click_button 'Sign Up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password supplied does not match confirmation' do
    visit '/'
    click_link 'Sign Up Here'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'pazzword'
    click_button 'Sign Up'
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end

end
