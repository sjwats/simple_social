class UserEvent < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :user_events

  belongs_to :event,
    inverse_of: :user_events

  validates_presence_of :user
  validates_presence_of :event
end
