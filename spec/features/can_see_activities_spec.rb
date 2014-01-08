require 'spec_helper'

feature 'user can see list of activities' do
  scenario 'user can navigate to an activity list' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_link 'Activities List'
    expect(page).to have_content('Select Your Favorite Activities')
  end

  scenario 'user can select activities they prefer' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    sign_in_as(user)
    click_link 'Activities List'
    check foosball.name
    check running.name
    click_on 'Save Preferred Activities'
    #binding.pry
    #save_and_open_page
    expect(page).to have_content(foosball.name)
    expect(page).to have_content(running.name)
    expect(page).to have_content('User Information Successfully Updated!')
    Activity.destroy_all

  end

  # scenario 'user can add an activity to the list' do
  #   user = FactoryGirl.create(:user)
  #   visit '/'
  #   click_link 'Sign In'
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Sign In'
  #   click_link 'Activities List'
  #   click_link 'Add a new activity to the list'
  #   fill_in 'Name', with: 'Hiking'
  #   click_button 'Add Activity'
  #   expect(page).to have_content('Hiking')
  #   expect(page).to have_content('Successfully added an activity')
  # end

  # scenario 'user tries to add activity with improper information' do
  #   user = FactoryGirl.create(:user)
  #   visit '/'
  #   click_link 'Sign In'
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Sign In'
  #   visit new_user_activity_path
  #   click_button 'Add Activity'
  #   within ".input.activity_name" do
  #     expect(page).to have_content "can't be blank"
  #   end
  # end

end
