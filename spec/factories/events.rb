# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association :activity

  start_time DateTime.now + 10.days
  end_time {start_time + 1.hour}
  num_attendees_requested 10
  location_name 'Bar'
  street_address '90 Comm Ave'
  city 'Boston'
  state 'MA'
  description 'mas foosball'
  end
end
