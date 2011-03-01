class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.string :title, :limit => 100
      t.string :icon_path, :limit => 256
      t.string :content_type, :limit => 64
      t.text :body
      t.timestamps
    end

    Series.create!(:title => 're-write this book', :icon_path => '/images/iconos/rewrite.jpg')
    Series.create!(:title => 'vibooka', :icon_path => '/images/iconos/vibooka.jpg')
    Series.create!(:title => 'libros a la carta', :icon_path => '/images/iconos/carta.jpg')

    add_column :projects, 'series_id', :integer, :default => 1
  end

  def self.down
    drop_table :series
    remove_column :projects, 'series_id'
  end
end
