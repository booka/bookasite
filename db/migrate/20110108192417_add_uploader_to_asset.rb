class AddUploaderToAsset < ActiveRecord::Migration
  def self.up
    add_column :assets, :file, :string
    remove_column :assets, :asset_file_name
    remove_column :assets, :asset_content_type
    remove_column :assets, :asset_file_size
    remove_column :assets, :asset_updated_at
  end

  def self.down
    remove_column :assets, :file
    add_column :assets, :asset_file_name, :string
    add_column :assets, :asset_content_type, :string
    add_column :assets, :asset_file_size, :string
    add_column :assets, :asset_updated_at, :string
  end
end
