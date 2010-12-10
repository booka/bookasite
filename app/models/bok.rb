class Bok < ActiveRecord::Base
  acts_as_list :scope => "project_id"
  serialize :properties

  belongs_to :user
  belongs_to :project, :class_name => 'Project'

  validates :user, :presence => true
  validates :project, :presence => true

  def scope_condition
    "project_id = #{project_id} AND #{connection.quote_column_name("type")} = #{quote_value(self.class.name)}"
  end

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end
end
