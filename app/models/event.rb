class Event < ActiveRecord::Base
  validates_presence_of :date
  validates_date :date
  validates_presence_of :start_time
  validates_time :start_time
  validates_time :end_time, allow_blank: true
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state
  validates :status, inclusion: { in: [true, false] }
  validates_presence_of :activity_id

  belongs_to :activity,
    inverse_of: :events
  has_many :user_events,
    inverse_of: :event
  has_many :users,
    through: :user_events
end
