class SessionsController < ApplicationController
  def new
  end

  def show
    
  end

  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_from_auth(auth)
      @auth = Authorization.create_from_auth(auth, current_user)
    end
    self.current_user = @auth.user

    redirect_to stored_or(root_path)
  end

  def destroy
    self.clear_user
    redirect_to root_path
  end
end
