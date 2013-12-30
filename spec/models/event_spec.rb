require 'spec_helper'

describe Event do
  #validate date and time with validates_timeliness gem?
  it { should have_valid(:date).when(Date.parse("2013-12-20")) }
  it { should_not have_valid(:date).when('12/32/2013', '12/0/2013', '13/2013') }

  it { should have_valid(:start_time).when('12:20pm') }

  it { should have_valid(:end_time).when('12:20am') }

  it { should have_valid(:location_name).when('TD Garden', 'Random park name') }

  it { should have_valid(:street_address).when('132 This street') }

  it { should have_valid(:city).when('Boston', 'New Cityname') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA', 'New Hapmshire', 'Maine') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:num_attendees_requested).when(3, 4) }

  it { should have_valid(:description).when("Let's play ball", "This is the activity. Yada yada description.") }
  it { should_not have_valid(:description).when(nil, '') }

  it { should have_valid(:status).when(true, false) }

  it { should belong_to :activity }

  it { should have_many :user_events }

  it { should have_many(:users).through(:user_events) }

end
