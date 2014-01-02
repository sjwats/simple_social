require 'spec_helper'

describe User do
  it { should have_many :user_events }
  it { should have_many(:events).through(:user_events) }

  it { should have_many :user_activities }
  it { should have_many(:activities).through(:user_activities) }

  it { should validate_presence_of :first_name }
  it { should have_valid(:first_name).when('John', 'Betty Jo') }

  it { should validate_presence_of :last_name }
  it { should have_valid(:last_name).when('Watson', 'De Ford') }

  it { should validate_presence_of :email }
  it { should have_valid(:email).when('john@aol.com') }
  it { should_not have_valid(:email).when('john.com', 'john@com', 'john') }

  it 'has a matching password confirmation for the password supplied' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end


end
