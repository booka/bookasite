class JobsController < ApplicationController
  before_filter :require_super
  expose(:jobs) { Job.queue }
  expose(:finished) { Job.completed }
  expose(:job)
  expose(:app_vars) { AppVar.all }

  def index
  end

  def work
    job = Job.queue.first
    if job
      worker = Worker.new(job)
      flash[:worker_output] = worker.output if worker.execute
    end
    redirect_to jobs_path
  end

  def create
    params[:job][:user_id] = current_user
    Job.create(params[:job])
    redirect_to jobs_path
  end
end
