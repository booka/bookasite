class Bok < ActiveRecord::Base
  acts_as_list :scope => "project_id"
  serialize :properties

  belongs_to :user
  belongs_to :project, :class_name => 'Project'

  validates :user, :presence => true
  validates :project, :presence => true

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end
end
