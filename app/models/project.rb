class Project < ActiveRecord::Base
  serialize :properties
  has_many :calls, :order => 'position DESC'
  has_many :contents
  attr_accessible :title, :description, :content_state

  # FIXME:metaprogramming here!
  def content_state=(state)
    properties ||= {}
    properties['content_state'] = state
  end
  
  def content_state
    properties.present? && (properties['content_state'] || 'closed')
  end

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end
end
