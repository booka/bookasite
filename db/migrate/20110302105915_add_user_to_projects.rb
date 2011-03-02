class AddUserToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :user_id, :integer

    user = User.first
    Project.all.each do |project|
      project.update_attribute(:user_id, user.id)
    end

  end

  def self.down
    remove_column :projects, :user_id
  end
end
