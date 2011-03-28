class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthModule
  layout 'public'

  helper_method :current_user, :signed_in?
  helper_method :project?

  protected
  def load_project
    @project = Project.find params[:project_id]
  end

  def project?
    self.respond_to? :project
  end

  def self.edit_require_user
    before_filter :require_user, :except => [:index, :show]
  end
end
