class CreateBoks < ActiveRecord::Migration
  def self.up
    create_table :boks do |t|
      t.references :project
      t.references :user
      t.integer :position
      t.string :type, :limit => 32
      t.string :title, :limit => 300
      t.string :description, :limit => 1024
      t.string :content_type, :limit => 64
      t.string :properties, :length => 1024
      t.text :body
      t.timestamps
    end

    add_index :boks, :type
    add_index :boks, :title
    #add_index :boks, :ancestry

  end

  def self.down
    drop_table :boks
  end
end