require 'spec_helper'

feature 'user signs in' do
  scenario 'existing user signs in with valid information' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Signed in successfully. Welcome Back!')

  end

  scenario 'a non-member email and password is provided' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'not@member.com'
    fill_in 'Password', with: 'youshallnotpass'
    click_button 'Login'
    expect(page).to have_content('Invalid email or password.')
    expect(page).to_not have_content('Signed in successfully. Welcome Back!')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'an existing email with a wrong password is denied' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'notgonnawork'
    click_button 'Login'
    expect(page).to have_content("Invalid email or password")
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Signed in successfully. Welcome Back!')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Login')

    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
    expect(page).to_not have_content('Signed in successfully. Welcome Back!')
  end



end
