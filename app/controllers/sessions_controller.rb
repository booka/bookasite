class SessionsController < ApplicationController
  def new
  end

  def show

  end

  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_auth(auth)
      user = User.find_or_create_from_auth!(auth)
      @auth = Authorization.create_from_auth(auth, user)
    end

    self.current_user = @auth.user
    Activity.report(@auth.user, nil, :create, 'UserSession', nil)
    redirect_to stored_or(root_path)
  end

  def destroy
    self.clear_user
    redirect_to root_path
  end

  def enter
    if current_user && current_user.id == 1
      self.current_user = User.find params[:id]
    end
    redirect_to stored_or(root_path)
  end
end
