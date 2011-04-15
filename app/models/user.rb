class User < ActiveRecord::Base
  has_paper_trail

  has_many :authorizations, :dependent => :destroy
  has_many :permissions, :dependent => :destroy
  has_many :boks, :dependent => :destroy
  has_many :notifications, :order => 'created_at ASC', :dependent => :destroy

  validates :name, :presence => true
  validates :email, :presence => true

  def admin?
    roles == 'admin'
  end

  def super?
    self.id == 1 || self.roles == 'super'
  end

  def title
    self.name
  end

  def to_param
    name ? "#{id}-#{name.parameterize}" : id.to_s
  end

  def self.find_or_create_from_auth!(auth)
    user_info = auth['user_info']
    email = user_info['email']
    puts "EMAIL #{email}"
    user = User.find_by_email(email)
    user ||= User.create(:name => user_info['name'], :avatar_url => user_info['image'],
                         :email => email)
    user
  end
end