class CallsController < ApplicationController
  def show
    @calls = Call.all
    @project = Project.find(params[:project_id])
    @call = @project.calls.first
  end
end
