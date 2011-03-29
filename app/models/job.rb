class Job < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :bok, :polymorphic => true
  serialize :options

  validates :user_id, :presence => true

end
