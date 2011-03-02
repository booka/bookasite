class AddResourceToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :resource_id, :integer
    add_column :assets, :resource_type, :string, :limit => 64
  end

  def self.down
    remove_column :assets, :resource_id
    remove_column :assets, :resource_type
  end
end
