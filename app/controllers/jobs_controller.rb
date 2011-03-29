class JobsController < ApplicationController
  expose(:jobs) { Job.all }
  expose(:job)

  def index
  end

  def work
    job = Job.first
    worker = Worker.new(job)
    render :text => worker.execute
  end

  def create
    params[:job][:user_id] = current_user
    Job.create(params[:job])
    redirect_to jobs_path
  end
end
