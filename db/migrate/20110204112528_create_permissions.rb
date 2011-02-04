class CreatePermissions < ActiveRecord::Migration

  def self.up
    create_table :permissions do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :level, :limit => 8
      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
