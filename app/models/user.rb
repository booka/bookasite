class User < ActiveRecord::Base
  has_many :authorizations


  def admin?
    roles == 'admin'
  end

  def self.create_from_auth!(hash)
    create(:name => hash['user_info']['name'])
  end
end