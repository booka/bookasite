class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.references :project
      t.references :user
      t.references :bok, :polymorphic => true
      t.string :name, :limit => 100
      t.string :options, :limit => 1024
      t.datetime :start_after
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :priority, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
