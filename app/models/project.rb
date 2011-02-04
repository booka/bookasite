# Un Booka
class Project < ActiveRecord::Base
  serialize :properties
  has_many :calls, :order => 'position DESC'
  has_many :contents, :order => 'position'
  has_many :proposals
  has_many :assets
  has_many :permissions

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
end
