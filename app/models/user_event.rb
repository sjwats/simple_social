class UserEvent < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :event
  validates_numericality_of :user_id
  validates_numericality_of :event_id


end
