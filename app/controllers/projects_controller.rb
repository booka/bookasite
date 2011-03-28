class ProjectsController < ApplicationController
  respond_to :html
  expose(:projects)
  expose(:project)

  def index
    redirect_to root_path
  end
  
  def show
    redirect_to project_call_path(params[:id])
  end

  def edit
  end

  def update
    project.update_attributes(params[:project])
    respond_with project, :location => project
  end

end
