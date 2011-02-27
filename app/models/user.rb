class User < ActiveRecord::Base
  has_many :authorizations
  has_many :permissions

  def admin?
    roles == 'admin'
  end
  
  def title
  	self.name
  end

  def self.find_or_create_from_auth!(hash)
    user_info = hash['user_info']
    create(:name => user_info['name'], :avatar_url => user_info['image'],
      :email => user_info['email'])
  end
end