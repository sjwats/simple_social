require 'spec_helper'

describe UserActivity do
  it { should validate_presence_of :user}
  it { should validate_numericality_of :user_id}

  it { should validate_presence_of :activity}
  it { should validate_numericality_of :activity_id}

  it { should belong_to :user }
  it { should belong_to :activity }

end
