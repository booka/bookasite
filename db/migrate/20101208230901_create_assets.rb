class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :title
      t.string :description, :limit => 300
      t.string :asset_file_name
      t.string :asset_content_type
      t.string :asset_file_size
      t.string :asset_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
