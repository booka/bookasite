# Un Booka
class Project < ActiveRecord::Base
  serialize :properties
  belongs_to :series
  belongs_to :user
  has_many :calls, :order => 'position DESC'
  has_many :contents, :order => 'position'
  has_many :proposals
  has_many :assets
  has_many :permissions
  has_many :asambleas

  validates :series_id, :presence => true
  validates :title, :presence => true
  validates :user_id, :presence =>  true

  after_create :create_call

  # find or build a project user proposal
  def proposal(rol, user)
    conditions = {:rol => rol, :user_id => user.id}
    proposal = proposals.where(conditions).first
    proposal ||= proposals.build(conditions)
    proposal
  end

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end

  def create_asamblea(params = {})
    params = {:user => self.user, :title => self.title}.merge(params)
    self.asambleas.create(params)
  end

  private
  def create_call
    self.calls.create(:user => self.user, :title => self.title)
  end

end
