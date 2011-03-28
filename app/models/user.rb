class User < ActiveRecord::Base
  has_many :authorizations, :dependent => :destroy
  has_many :permissions, :dependent => :destroy
  has_many :boks, :dependent => :destroy

  validates :name, :presence => true
  validates :email, :presence => true

  def admin?
    roles == 'admin'
  end

  def title
    self.name
  end

  def to_param
    name ? "#{id}-#{name.parameterize}" : id.to_s
  end

  def self.find_or_create_from_auth!(hash)
    user_info = hash['user_info']
    email = user_info['email']
    puts "EMAIL #{email}"
    user = User.find_by_email(email)
    user ||= User.create(:name => user_info['name'], :avatar_url => user_info['image'],
                         :email => email)
    user
  end
end