class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.string :name
      t.string :content_type, :string, :limit => 64
      t.text :body
      t.timestamps
    end

    Serie.create!(:name => 're-write this book')
    Serie.create!(:name => 'vibooka')
    Serie.create!(:name => 'libros a la carta')

    add_column :projects, 'serie_id', :integer, :default => 1
  end

  def self.down
    drop_table :series
    remove_column :projects, 'serie_id'
  end
end
