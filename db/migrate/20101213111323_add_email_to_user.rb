class AddEmailToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string, :limit => 300
    add_column :users, :avatar_url, :string, :limit => 300
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :avatar_url
  end
end
