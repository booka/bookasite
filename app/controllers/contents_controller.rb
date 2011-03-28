class ContentsController < ApplicationController
  expose(:project)
  #show
  expose(:serie) { project.serie }
  expose(:contents) { project.contents }
  expose(:content)

  def index
    redirect_to [project, project.contents.first]
  end

  def show
  end
end
