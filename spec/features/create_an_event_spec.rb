require 'spec_helper'

feature 'user creates a new event' do
  scenario 'user creates an event with valid info' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    sign_in_as(user)
    click_on 'Create A New Event'
    select '2014-01-20', from: 'Date'
    select '4:00pm', from: 'Start time'
    select '5:00pm', from: 'End time'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Description', with: 'mas foosball'
    fill_in 'Status', with: 'Open'
    select foosball.name, from: 'Activity'
    click_on 'Create Event'
    Activity.destroy_all
  end

end
