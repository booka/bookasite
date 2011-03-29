class PermissionsController < ApplicationController
  respond_to :html
  after_filter { |controller| Activity.register(controller, current_user, permission) }
  expose(:project) { Project.get(params[:project_id])}

  #index
  expose(:permissions) { project.permissions }

  # new, edit
  expose(:permission)

  def index
  end

  def new
  end

  def edit
  end

  def create
    permission = project.permissions.build(params[:permission])
    permission.save
    respond_with permission, :location => [project, :permissions]
  end

  def update
    permission.update_attributes(params[:permission])
    respond_with permission, :location => [project, :permissions]
  end

  def destroy
    permission.destroy
    redirect_to [:project, :permissions]
  end

end
