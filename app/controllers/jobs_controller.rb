class JobsController < ApplicationController
  expose(:jobs) { Job.queue }
  expose(:job)

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
