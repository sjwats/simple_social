require 'spec_helper'

feature 'user creates a new event' do
  scenario 'user creates an event with valid info' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    location = 'Bar'
    address = '90 Comm Ave'
    city = 'Boston'
    state = 'MA'
    num_invites = 10
    description = 'mas foosball'
    sign_in_as(user)
    click_on 'Create A New Event'
    select "#{Date.today.year + 1}", from: "event_start_time_1i"
    select "January", from: "event_start_time_2i"
    select "9", from: "event_start_time_3i" #day
    select "07 PM", from: "event_start_time_4i" #hour
    select "30", from: "event_start_time_5i" #minute
    select "#{Date.today.year + 1}", from: "event_end_time_1i"
    select "January", from: "event_end_time_2i"
    select "9", from: "event_end_time_3i"
    select "08 PM", from: "event_end_time_4i"
    select "30", from: "event_end_time_5i"
    fill_in 'Num attendees requested', with: num_invites
    fill_in 'Location name', with: location
    fill_in 'Street address', with: address
    fill_in 'City', with: city
    fill_in 'State', with: state
    fill_in 'Description', with: description
    select foosball.name, from: 'Activity'
    click_on 'Create Event'
    expect(page).to have_content('Event Created Successfully')
    expect(page).to have_content(location)
    expect(page).to have_content(num_invites)
    expect(page).to have_content(city)
    expect(page).to have_content(state)
    expect(page).to have_content(description)
    expect(page).to have_content(foosball.name)
    save_and_open_page
    Activity.destroy_all
  end

  scenario 'user creates event with invalid attributes' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    sign_in_as(user)
    click_on 'Create A New Event'
    click_on 'Create Event'
    within '.input.event_city' do
      expect(page).to have_content("can't be blank")
    end
    within '.input.event_state' do
      expect(page).to have_content("can't be blank")
    end
    within '.input.event_description' do
      expect(page).to have_content("can't be blank")
    end
    within '.input.event_activity' do
      expect(page).to have_content("can't be blank")
    end
    within '.input.event_start_time' do
      expect(page).to have_content('must be before')
    end
  end

end
