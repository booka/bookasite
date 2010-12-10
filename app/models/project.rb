class Project < ActiveRecord::Base
  serialize :properties
  has_many :calls, :order => 'position DESC'
  has_many :contents, :order => 'position'

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end
end
