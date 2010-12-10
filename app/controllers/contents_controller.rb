class ContentsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @contents = @project.contents
    render :action => 'show'
  end

  def show
    @project = Project.find(params[:project_id])
    @contents = @project.contents
    @content = Content.find params[:id]
  end
end
