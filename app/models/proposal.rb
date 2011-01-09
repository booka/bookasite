class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  1.upto(4) {|n| mount_uploader "file#{n}", ProposalUploader}
end
