class AddFilesToProposal < ActiveRecord::Migration
  def self.up
    1.upto(4) {|n| add_column :proposals, "file#{n}", :string }
  end

  def self.down
    1.upto(4) {|n| remove_column :proposals, "file#{n}" }
  end
end
