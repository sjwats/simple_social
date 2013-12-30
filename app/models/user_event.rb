class UserEvent < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :event
  validates_presence_of :users_event_role
  validates_presence_of :users_attend_status
  validates_numericality_of :user_id
  validates_numericality_of :event_id


end
