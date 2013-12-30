class UserActivity < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates_presence_of :user
  validates_presence_of :activity
  validates_numericality_of :user_id
  validates_numericality_of :activity_id
end
