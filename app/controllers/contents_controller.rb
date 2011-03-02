class ContentsController < ApplicationController
  layout 'grid'

  def index
    @project = Project.find(params[:project_id])
    @contents = @project.contents
  end

  def show
    @project = Project.find(params[:project_id])
    @contents = @project.contents
    @content = Content.find params[:id]
  end
end
