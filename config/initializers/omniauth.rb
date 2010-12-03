require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  provider :openid, nil, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end