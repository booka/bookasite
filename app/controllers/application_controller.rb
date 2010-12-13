class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthModule
  
  helper_method :current_user, :signed_in?
  
  protected
  def load_project
    @project = Project.find params[:project_id]
  end
end
