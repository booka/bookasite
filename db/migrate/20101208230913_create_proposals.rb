class CreateProposals < ActiveRecord::Migration
  def self.up
    create_table :proposals do |t|
      t.references :user
      t.references :project
      t.string :rol, :limit => 32
      t.string :title, :limit => 300
      t.string :authors, :limit => 300
      t.string :description, :limit => 500
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :proposals
  end
end
