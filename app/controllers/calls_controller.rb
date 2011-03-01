class CallsController < ApplicationController
  layout 'grid1140'

  def show
    @calls = Call.all
    @project = Project.find(params[:project_id])
    @call = @project.calls.first
  end
end
