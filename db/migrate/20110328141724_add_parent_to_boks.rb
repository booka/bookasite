class AddParentToBoks < ActiveRecord::Migration
  def self.up
    add_column :boks, :parent_id, :integer
    add_column :boks, :parent_type, :string, :limit => 32
  end

  def self.down
    remove_column :boks, :parent_id
    remove_column :boks, :parent_type
  end
end
