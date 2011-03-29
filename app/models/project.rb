# Un Booka
class Project < ActiveRecord::Base
  has_paper_trail(:meta => {
      :project_id => Proc.new { |project| project.id }
  })

  serialize :properties
  belongs_to :serie
  belongs_to :user
  has_many :calls, :order => 'position DESC'
  has_many :contents, :order => 'position'
  has_many :proposals
  has_many :assets
  has_many :permissions
  has_many :asambleas

  validates :serie_id, :presence => true
  validates :title, :presence => true
  validates :slug, :presence => true
  validates :user_id, :presence =>  true

  after_create :create_call

  def self.get(id)
    Project.find_by_slug(id)
  end

  # find or build a project user proposal
  def proposal(rol, user)
    conditions = {:rol => rol, :user_id => user.id}
    proposal = proposals.where(conditions).first
    proposal ||= proposals.build(conditions)
    proposal
  end

  def to_param
    slug ? slug.parameterize : id.to_s
  end

  private
  def create_call
    self.calls.create(:user => self.user, :title => self.title)
  end

end
