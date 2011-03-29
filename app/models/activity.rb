class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  scope :system, :conditions => {:project_id => nil}

  default_scope :order => 'id DESC'

  def self.create_from_version(version)
    project = version.project_id.present? ? Project.find(version.project_id) : nil
    resource_type = version.bok_type.present? ? version.bok_type : version.item_type
    resource_id = version.item_id
    user = version.whodunnit.present? ? User.find(version.whodunnit) : nil
    action = version.event
    body = "#{user.name if user} en #{project.title if project} - #{action} #{resource_type}"

    Activity.create(:project => project, :resource_type => resource_type, :resource_id => resource_id,
    :user => user, :body => body)
  end

  def notify
    subscriptions = []
    if self.project.present?
      self.project.permissions.all.each do |permission|
        subscriptions << ActivitySubscription.create!(:activity => self, :user => permission.user)
      end
    end
    subscriptions
  end

end
