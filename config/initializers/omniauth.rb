require 'openid/store/filesystem'


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  provider :openid, nil, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  provider :twitter, 'cZLzgKHY9phSNDuyFImKTw', 'PV6e164UZaPW9Lq5XHW9C0k37ZZNMxLwv41ewlH8D4'
end