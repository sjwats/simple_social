require 'spec_helper'

feature 'user can see list of activities' do
  scenario 'user can navigate to an activity list' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'View/Select from List'
    expect(page).to have_content('What Interests You?')
  end

  scenario 'user can select and save activities they prefer' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    sign_in_as(user)
    click_on 'View/Select from List'
    check foosball.name
    check running.name
    click_on 'Update User'
    expect(page).to have_content(foosball.name)
    expect(page).to have_content(running.name)
    expect(page).to have_content('User Information Successfully Updated!')
  end

end
