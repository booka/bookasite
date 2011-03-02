class Admin::ProjectsController < Admin::AdminController
  inherit_resources
  after_filter { |controller| Activity.register(controller, current_user, @project) }
  respond_to :html, :xml, :json

  def create
    params[:project][:user_id] = current_user.id
    create!
  end

end
