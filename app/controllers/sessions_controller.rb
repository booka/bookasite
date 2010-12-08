class SessionsController < ApplicationController
  def new
    
  end

  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_from_auth(auth)
      @auth = Authorization.create_from_auth(auth, current_user)
    end
    self.current_user = @auth.user

    render :text => "Welcome, #{current_user.name}."
  end
end
