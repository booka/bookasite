class RenameSeriesIntoSerie < ActiveRecord::Migration
  def self.up
    rename_column :projects, :series_id, :serie_id
  end

  def self.down
    rename_column :projects, :serie_id, :series_id
  end
end
