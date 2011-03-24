class CallsController < ApplicationController
  layout 'public'

  def show
    @calls = Call.all
    @project = Project.find(params[:project_id])
    @call = @project.calls.first
    @series = @project.series
  end
end
