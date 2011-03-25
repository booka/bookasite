class ContentsController < ApplicationController
  before_filter :load_project
  layout 'public'

  def index
    redirect_to [@project, @project.contents.first]
  end

  def show
    @series = @project.series
    @contents = @project.contents
    @content = Content.find params[:id]
  end
end
