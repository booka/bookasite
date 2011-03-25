class SessionsController < ApplicationController
  layout 'public'

  def new
  end

  def show

  end

  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_auth(auth)
      @auth = Authorization.create_from_auth(auth, current_user) 
    end

    self.current_user = @auth.user
    Activity.report(@auth.user, nil, :create, 'UserSession', nil)
    redirect_to stored_or(root_path)
  end

  def destroy
    self.clear_user
    redirect_to root_path
  end
end
