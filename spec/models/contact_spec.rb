require 'spec_helper'

describe Contact do

  it { should have_valid(:last_name).when('Watson') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:first_name).when('John') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should validate_presence_of :email }
  it { should have_valid(:email).when('john@watson.com') }
  it { should_not have_valid(:email).when('watson.com', 'john', 'john@com') }

  it { should have_valid(:subject).when('This is the subject') }
  it { should_not have_valid(:subject).when(nil, '') }

  it { should have_valid(:description).when('This is the description. This is more of it.') }
  it { should_not have_valid(:description).when(nil, '') }

  it 'sends and email when contact submission is successful' do
    prev_mail_count = ActionMailer::Base.deliveries.count
    FactoryGirl.build(:contact).
  end

end
