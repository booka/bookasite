class AddContentTypeToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :content_type, :string, :limit => 64
  end

  def self.down
    remove_column :pages, :content_type
  end
end
