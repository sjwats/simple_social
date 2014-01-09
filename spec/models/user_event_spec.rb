require 'spec_helper'

describe UserEvent do
  it { should validate_presence_of :user }
  it { should validate_numericality_of :user_id }

  it { should validate_presence_of :event }
  it { should validate_numericality_of :event_id }

  it { should belong_to :user }
  it { should belong_to :event }


end
