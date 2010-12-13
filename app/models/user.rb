class User < ActiveRecord::Base
  has_many :authorizations

  def admin?
    roles == 'admin'
  end

  def self.create_from_auth!(hash)
    user_info = hash['user_info']
    create(:name => user_info['name'], :avatar_url => user_info['image'],
      :email => user_info['email'])
  end
end