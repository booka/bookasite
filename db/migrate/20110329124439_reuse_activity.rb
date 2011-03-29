class ReuseActivity < ActiveRecord::Migration
  def self.up
    drop_table :activities
    create_table :activities do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.belongs_to :resource, :polymorphic => true
      t.boolean :notified, :default => false
      t.string :action, :limit => 64
      t.string :url, :limit => 300
      t.string :link, :limit => 200
      t.datetime :created_at
      t.datetime :activity_at
    end

  end

  def self.down
    drop_table :activities
    create_table :activities do |t|
      t.string :action
      t.string :model
      t.references :model
      t.references :user
      t.timestamps
    end

  end
end
