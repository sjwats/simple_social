class Contact < ActiveRecord::Base
  validates_presence_of :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates_presence_of :subject
  validates_presence_of :description
  validates_presence_of :first_name
  validates_presence_of :last_name

  def submit_contact_info
    if save
      ContactConfirmation.receipt(self).deliver
      return true
    end
  end
end
