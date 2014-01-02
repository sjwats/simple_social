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

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_email_format_of :email
  validates_presence_of :role

  def is_admin?
    role == 'admin'
  end
end
