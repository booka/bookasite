class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.string :name
      t.string :content_type, :limit => 64
      t.text :body
      t.timestamps
    end

    Series.create!(:name => 're-write this book')
    Series.create!(:name => 'vibooka')
    Series.create!(:name => 'libros a la carta')

    add_column :projects, 'series_id', :integer, :default => 1
  end

  def self.down
    drop_table :series
    remove_column :projects, 'series_id'
  end
end
