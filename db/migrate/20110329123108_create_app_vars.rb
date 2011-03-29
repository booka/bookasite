class CreateAppVars < ActiveRecord::Migration
  def self.up
    create_table :app_vars do |t|
      t.string :name, :limit => 64
      t.integer :count, :default => 0
      t.integer :value, :default => 0
      t.string :data, :limit => 16
      t.timestamps
    end

  end

  def self.down
    drop_table :app_vars
  end
end
