class TopicsController < ApplicationController
  respond_to :html
  before_filter :load_project, :load_asamblea

  def new
    @topic = Topic.new
    respond_with @topic
  end

  def load_asamblea
    @asamblea = @project.asambleas.find params[:asamblea_id]

  end

end
