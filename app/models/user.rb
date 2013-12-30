class User < ActiveRecord::Base
  has_many :user_events,
    inverse_of: :user
  has_many :events,
    through: :user_events
  has_many :user_activities,
    inverse_of: :user
  has_many :activities,
    through: :user_activities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
