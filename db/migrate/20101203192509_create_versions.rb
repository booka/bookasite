class CreateVersions < ActiveRecord::Migration
  def self.up
    unless table_exists? :versions
      create_table :versions do |t|
        t.string :item_type, :null => false
        t.integer :item_id, :null => false
        t.string :event, :null => false
        t.string :whodunnit
        t.string :bok_type, :limit => 16
        t.integer :project_id
        t.text :object
        t.datetime :created_at
      end
      add_index :versions, [:item_type, :item_id]
    end
  end

  def self.down
    remove_index :versions, [:item_type, :item_id]
    drop_table :versions
  end
end
