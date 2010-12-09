class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title, :limit => 300
      t.string :description, :limit => 1024
      t.string :properties, :limit => 1024
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
