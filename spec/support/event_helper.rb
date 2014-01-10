module EventHelper
  def build_event
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
    fill_in 'Num attendees requested', with: 10
    fill_in 'Location name', with: 'Bar'
    fill_in 'Street address', with: '90 Comm Ave'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Description', with: 'mas foosball'
    select 'Foosball', from: 'Activity'
    click_on 'Create Event'
  end

  def build_events
    build_event
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
    fill_in 'Num attendees requested', with: 15
    fill_in 'Location name', with: 'Trail'
    fill_in 'Street address', with: '90 Trail Ave'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Description', with: 'running for fun?'
    select 'Running', from: 'Activity'
    click_on 'Create Event'
  end

end
