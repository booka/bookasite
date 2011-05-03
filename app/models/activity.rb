class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :version

  scope :system, :conditions => {:project_id => nil}

  default_scope :order => 'id DESC'


  def self.create_from_version(version)
    project = version.project_id.present? ? Project.find(version.project_id) : nil
    user = version.whodunnit.present? ? User.find(version.whodunnit) : nil
    resource_type = version.bok_type.present? ? version.bok_type : version.item_type
    create_from_params(project, version.item_id, version.event, resource_type, user, version.created_at)
  end

  def self.create_from_bok(bok, action, user)
    create_from_params(bok.project, bok.id, action, bok.type, user, bok.updated_at)
  end

  def notify
    notifications = []
    if self.project.present?
      self.project.permissions.all.each do |permission|
        notifications << Notification.create!(:activity => self, :user => permission.user)
      end
    end
    notifications
  end

  def self.create_from_params(project, resource_id, version_event, resource_type, user, activity_at)
    event = I18n.t "activity.action.#{version_event}"
    model = I18n.t "activity.model.#{resource_type}"
    action = "#{event} #{model}"
    link = '+ info...'
    url = "/models/#{resource_type.downcase.pluralize}/#{resource_id}"

    Activity.create(:project => project, :resource_type => resource_type, :resource_id => resource_id,
                    :user => user, :action => action, :url => url, :activity_at => activity_at, :link => link)
  end

end
