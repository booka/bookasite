# Base class for other types
class Bok < ActiveRecord::Base
  acts_as_list :scope => "project_id"
  serialize :properties

  belongs_to :user
  belongs_to :project, :class_name => 'Project'
  belongs_to :parent, :polymorphic => true
  has_many :assets, :as => :resource

  validates :user, :presence => true
  validates :project, :presence => true

  def data
    properties ||= {}
    properties
  end

  def scope_condition
    type = self.type || self.class.name
    "project_id = #{project_id} AND #{connection.quote_column_name("type")} = #{quote_value(type)}"
  end

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end

  protected
  def self.property(name)
    define_method name do
      puts "*** GET #{name}"
      self.properties = {} if self.properties.blank?
      self.properties[name]
    end

    define_method "#{name}=" do |value|
      puts "*** SET #{name}: #{value}"
      self.properties = {} if self.properties.blank?
      self.properties[name] = value
    end
  end
end
