class Activity < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :events,
    inverse_of: :activity
  has_many :user_activities,
    inverse_of: :activity
  has_many :users,
    through: :user_activities
end
