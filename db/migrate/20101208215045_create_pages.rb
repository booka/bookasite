class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title, :limit => 300
      t.string :slug, :limit => 100
      t.text :body
      t.timestamps
    end
    add_index :pages, :slug
  end

  def self.down
    drop_table :pages
  end
end
