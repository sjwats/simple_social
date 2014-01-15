require 'spec_helper'

feature 'user can see list of activities' do
  scenario 'user can navigate to an activity list' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'View/Select from List'
    expect(page).to have_content('Select Your Favorite Activities')
  end

  scenario 'user can select activities they prefer' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    sign_in_as(user)
    click_on 'View/Select from List'
    check foosball.name
    check running.name
    click_on 'Save Preferred Activities'
    expect(page).to have_content(foosball.name)
    expect(page).to have_content(running.name)
    expect(page).to have_content('User Information Successfully Updated!')
  end

  scenario 'visitor tries to view/create activities' do
    visit '/'
    expect(page).to_not have_content('Activities List')
  end

end
