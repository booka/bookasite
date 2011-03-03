class AddPageToSeries < ActiveRecord::Migration
  def self.up
    add_column :series, :page_id, :integer
  end

  def self.down
    remove_column :series, :page_id
  end
end
