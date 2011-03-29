# Una propuesta para un booka
class Proposal < ActiveRecord::Base
  has_paper_trail(:meta => {
      :project_id => Proc.new { |proposal| proposal.project_id }
  })

  belongs_to :user
  belongs_to :project
  1.upto(4) {|n| mount_uploader "file#{n}", ProposalUploader}
end
