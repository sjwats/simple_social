require 'spec_helper'

feature 'user sign up' do
  scenario 'user provides all valid and required information' do
    visit new_user_registration_path
    within '.signup' do
      fill_in 'Last Name', with: 'Watson'
      fill_in 'Email', with: 'john@watson.com'
      fill_in 'user_password', with: 'password' #used css selector user_password to disambiguate for capybara
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign Up'
    end
    expect(page).to have_content('Sign Out')
  end

  scenario 'required info is missing' do
    visit new_user_registration_path
    within '.signup' do
      click_button 'Sign Up'
    end
    expect(page).to_not have_content("Welcome to Simple Social! Please complete your profile")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password supplied does not match confirmation' do
    visit new_user_registration_path
    within '.signup' do
      fill_in 'user_password', with: 'password'
      fill_in 'Password Confirmation', with: 'pazzword'
      click_button 'Sign Up'
    end
    expect(page).to_not have_content("Welcome to Simple Social! Please complete your profile")
    expect(page).to_not have_content("Sign Out")
  end

end
