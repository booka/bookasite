class CallsController < ApplicationController
  respond_to :html
  expose(:calls)
  expose(:project)
  expose(:call) { project.calls.first}
  expose(:serie) { project.serie }

  def show
  end
end
