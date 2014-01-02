require 'spec_helper'

feature 'user sign up' do
  scenario 'user provides all valid and required information' do
    visit '/'
    click_link 'Sign Up Here'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Watson'
    fill_in 'Email', with: 'john@watson.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content('Welcome to Simple Social!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'required info is missing'

  scenario 'password supplied does not match confirmation'

end
