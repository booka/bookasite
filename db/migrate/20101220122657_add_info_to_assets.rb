class AddInfoToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :user_id, :integer
    add_column :assets, :project_id, :integer
    add_column :assets, :rol, :string, :limit => 16
  end

  def self.down
    remove_column :assets, :user_id
    remove_column :assets, :project_id
    remove_column :assets, :rol
  end
end
