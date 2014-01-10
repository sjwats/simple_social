require 'spec_helper'

feature 'existing user edits personal info' do
  scenario 'user edits their registration info with valid info' do
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in_as(user)
    click_on "View Profile"
    click_on 'Edit Login Credentials'
    fill_in 'Email', with: 'jack@black.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'
    fill_in 'Current password', with: 'password'
    click_on 'Update'
    expect(page).to have_content('You updated your account successfully')
    click_on 'View Profile'
  end

  scenario 'user edits credentials with invalid info' do
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in_as(user)
    click_on 'View Profile'
    click_on 'Edit Login Credentials'
    click_on 'Update'
    expect(page).to have_content('Please review the problems below')
    within '.input.user_current_password' do
      expect(page).to have_content("can't be blank")
    end
  end

  scenario 'user edits preferred activities' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    biking = Activity.create(name: 'Biking')
    visit '/'
    sign_in_as(user)
    click_on 'Activities List'
    check foosball.name
    check running.name
    click_on 'Save Preferred Activities'
    click_on 'Activities List'
    check biking.name
    uncheck foosball.name
    uncheck running.name
    click_on 'Save Preferred Activities'
    expect(page).to have_content('User Information Successfully Updated!')
    expect(page).to have_content('Biking')
    expect(page).to_not have_content(foosball.name)
    expect(page).to_not have_content(running.name)
  end


let(:location) { 'Bar' }
let(:address) { '90 Comm Ave' }
let(:city) { 'Boston' }
let(:state) { 'MA' }
let(:num_invites) { 10 }
let(:description) { 'mas foosball' }

  scenario 'user edits event information' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    sign_in_as(user)
    build_event
    click_on 'Edit Event'
    fill_in 'Location', with: 'Anywhere'
    click_on 'Update Event'
    save_and_open_page
    expect(page).to have_content('Successfully Updated!')
    expect(page).to have_content('Anywhere')
    expect(page).to have_content(num_invites)
    expect(page).to have_content(city)
    expect(page).to have_content(state)
    expect(page).to have_content(description)
    expect(page).to have_content(foosball.name)
  end

end
