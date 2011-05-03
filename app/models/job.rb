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

  def self.create_activity(bok, action, user)
    Job.create(:name => 'activity.create', :options => {:action => action},
               :bok => bok, :project => bok.project, :user => user,
               :priority => 5)
  end

  def self.notify_user(user)
    unless Job.queue.where(:name => 'notify.user', :user_id => user.id).first
      Job.create(:name => 'notify.user', :user => user, :priority => 1)
    end
  end

end
