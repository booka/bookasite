class ReuseActivity < ActiveRecord::Migration
  def self.up
    drop_table :activities
    create_table :activities do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.belongs_to :resource, :polymorphic => true
      t.boolean :notified, :default => false
      t.text :body
      t.timestamps
    end

    create_table :activity_subscriptions do |t|
      t.belongs_to :user
      t.belongs_to :activity
      t.boolean :notified, :default => false
    end
  end

  def self.down
    drop_table :activity_subscriptions
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
