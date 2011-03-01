class Series < ActiveRecord::Base
  has_many :projects
  validates :name, :presence => true

  def to_param
    name ? "#{id}-#{name.parameterize}" : id.to_s
  end

end
