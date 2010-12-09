class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthModule
  
  helper_method :current_user, :signed_in?

end
