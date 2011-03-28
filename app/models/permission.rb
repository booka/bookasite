class Permission < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  validates :project_id, :presence => true, :uniqueness => {:scope => :user_id}
  validates :user_id, :presence => true, :uniqueness => {:scope => :project_id}
  
  LEVELS = [:read, :update, :manage]

  def self.of(user, project)
    Permission.where(:user_id => user.id).where(:project_id => project.id).first || Permission.new
  end
end
