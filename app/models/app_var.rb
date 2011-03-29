class AppVar < ActiveRecord::Base
  serialize :data
  before_save :increment_counter

  validates :name, :presence => true

  def self.get(name)
    AppVar.find_or_create_by_name(name)
  end


  protected
  def increment_counter
    self.count ||= 0
    self.count += 1
  end


end
