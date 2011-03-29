class AddSlugToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :slug, :string, :limit => 200
    add_index :projects, :slug

    Project.all.each do |project|
      project.update_attribute(:slug, "#{project.id}")
    end
  end

  def self.down
    remove_column :projects, :slug
  end
end
