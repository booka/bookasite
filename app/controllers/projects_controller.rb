class ProjectsController < ApplicationController
  layout 'grid1140'

  def index
    redirect_to root_path
  end
  
  def show
    redirect_to project_call_path(params[:id])
  end
end
