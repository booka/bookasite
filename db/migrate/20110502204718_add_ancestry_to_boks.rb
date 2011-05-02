class AddAncestryToBoks < ActiveRecord::Migration
  def self.up
    add_column :boks, :ancestry, :string
    add_index :boks, :ancestry
  end

  def self.down
    remove_index :boks, :ancestry
    remove_column :boks, :ancestry
  end
end
