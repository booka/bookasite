class Permission < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  validates :project, :presence => true, :uniqueness => {:scope => :user_id}
  validates :user, :presence => true, :uniqueness => {:scope => :project_id}
  
  LEVELS = [:read, :update, :manage]
end