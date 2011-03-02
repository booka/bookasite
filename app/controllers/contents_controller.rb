class ContentsController < ApplicationController
  layout 'grid'

  def index
    @project = Project.find(params[:project_id])
    redirect_to [@project, @project.contents.first]
  end

  def show
    @project = Project.find(params[:project_id])
    @series = @project.series
    @contents = @project.contents
    @content = Content.find params[:id]
  end
end
