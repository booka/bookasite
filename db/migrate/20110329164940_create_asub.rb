class CreateAsub < ActiveRecord::Migration
  def self.up
    create_table :asubs do |t|
      t.belongs_to :user
      t.belongs_to :activity
      t.boolean :notified, :default => false
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :asubs
  end
end
