class UserActivity < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :user_activities

  belongs_to :activity,
    inverse_of: :user_activities

  validates_presence_of :user
  validates_presence_of :activity

end
