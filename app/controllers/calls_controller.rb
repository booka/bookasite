class CallsController < ApplicationController
  respond_to :html
  expose(:calls)
  expose(:project)
  expose(:call) { project.calls.first}
  expose(:serie) { project.serie }

  def show
  end

  def edit
  end

  def update
    call.update_attributes(params[:call])
    respond_with call, :location => [project, call]
  end
end
