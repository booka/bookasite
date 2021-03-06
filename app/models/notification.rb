class Notification < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  validates :activity_id, :presence => true
  validates :user_id, :presence => true

  scope :pending, where("notified != ?", true)
  scope :notified, where("notified = ?", true)
end
