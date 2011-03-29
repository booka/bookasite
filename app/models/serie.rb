class Serie < ActiveRecord::Base
  has_paper_trail

  set_table_name 'series'
  has_many :projects
  belongs_to :page
  validates :title, :presence => true

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end

end
