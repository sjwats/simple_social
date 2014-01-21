class Event < ActiveRecord::Base
  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :activity

  validates_datetime :start_time, :on_or_after => lambda { DateTime.now }
  validates_datetime :end_time, after: :start_time

  belongs_to :activity,
    inverse_of: :events

  has_many :user_events,
    inverse_of: :event

  has_many :users,
    through: :user_events,
    inverse_of: :events

  has_many :comments,
    inverse_of: :event,
    dependent: :destroy

end
