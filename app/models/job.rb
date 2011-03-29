class Job < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :bok, :polymorphic => true
  serialize :options
  default_scope order('priority DESC, id ASC')

  scope :queue, where(:finished_at => nil)
  scope :completed, where('finished_at IS NOT NULL')


  validates :name, :presence => true
  validates :user_id, :presence => true

end
