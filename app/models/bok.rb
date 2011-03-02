# Base class for other types
class Bok < ActiveRecord::Base
  acts_as_list :scope => "project_id"
  serialize :properties

  belongs_to :user
  belongs_to :project, :class_name => 'Project'
  has_many :assets, :as => :resource

  validates :user, :presence => true
  validates :project, :presence => true

  def scope_condition
    type = self.type || self.class.name
    "project_id = #{project_id} AND #{connection.quote_column_name("type")} = #{quote_value(type)}"
  end

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end
end
