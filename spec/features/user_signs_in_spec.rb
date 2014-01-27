require 'spec_helper'

feature 'user signs in' do
  scenario 'existing user signs in with valid information' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Welcome Back!')

  end

  scenario 'a non-member email and password is provided' do
    visit new_user_session_path
    within ".signin" do
      fill_in 'Email', with: 'not@member.com'
      fill_in 'Password', with: 'youshallnotpass'
      click_button 'Login'
    end
    expect(page).to have_content('Invalid email or password.')
    expect(page).to_not have_content('Welcome Back!')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'an existing email with a wrong password is denied' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    within ".signin" do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'notgonnawork'
      click_button 'Login'
    end
    expect(page).to have_content("Invalid email or password")
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Welcome Back!')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    within ".signin" do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end
    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign in')
    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
    expect(page).to_not have_content('Welcome Back!')
  end

end
