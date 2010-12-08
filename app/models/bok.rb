class Bok < ActiveRecord::Base
  acts_as_list # :scope => "ancestry"
  serialize :properties

  belongs_to :user
  belongs_to :project, :class_name => 'Project'

  validates :user, :presence => true
  validates :project, :presence => true
end
