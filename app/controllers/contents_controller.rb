class ContentsController < ApplicationController
  expose(:project) { Project.get params[:project_id] }
  #show
  expose(:serie) { project.serie }
  expose(:contents) { project.contents }
  expose(:content)

  def index
    redirect_to [project, project.contents.first]
  end

  def show
    if params[:project_id].blank?
      content = Content.find params[:id]
      redirect_to [content.project, content]
    end
  end
end
