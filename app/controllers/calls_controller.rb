class CallsController < ApplicationController
  respond_to :html
  expose(:calls)
  expose(:project) { Project.get(params[:project_id]) }
  expose(:call) { project.calls.first}
  expose(:serie) { project.serie }

  def index
    render :action => :show
  end

  def show
    if params[:project_id].blank?
      call = Call.find params[:id]
      redirect_to [call.project,call]
    end
  end

  def edit
  end

  def update
    call.update_attributes(params[:call])
    respond_with call, :location => [project, call]
  end
end
