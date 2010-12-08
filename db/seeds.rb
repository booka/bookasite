
user = User.create!(:name => 'Dani', :roles => 'admin')
user.authorizations.create(:provider => 'google', :user_id => user.id,
  :uid => 'https://www.google.com/accounts/o8/id?id=AItOawlrwMxteT9a8OBeUd-LZU7axsnoszCc6ig')