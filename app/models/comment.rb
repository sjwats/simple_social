class Comment <ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :name

  belongs_to :event,
    inverse_of: :comments,
    counter_cache: true

  belongs_to :user,
    inverse_of: :comments

end
