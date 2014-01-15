require 'spec_helper'

describe Profile do
  it { should have_valid(:first_name).when('John', 'Billy Jo') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Watson', 'De Campos') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:date_of_birth).when('1/12/2103', 'Janaury 12th, 2013') }

  it { should have_valid(:about_me).when('Lots of interesting things. The list goes on.') }

  it { should have_valid(:hometown).when('Portland') }

  it { should have_valid(:current_location).when('Portland') }

  it { should belong_to(:user) }
end
