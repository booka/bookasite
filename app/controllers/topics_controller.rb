class TopicsController < ApplicationController
  edit_require_user
  respond_to :html
  expose(:project)
  expose(:asamblea)
  expose(:topics) { asamblea.topics }
  expose(:topic)

  #show
  expose(:answer) { topic.answers.build }
  expose(:comment) { topic.comments.build }

  def show
  end

  def new
  end

  def edit
  end

  def create
    params[:topic][:user_id] = current_user.id
    params[:topic][:project_id] = project.id
    topic = asamblea.topics.create(params[:topic])
    respond_with topic, :location => [project, asamblea, topic]
  end

  def update
    topic.update_attributes(params[:topic])
    respond_with topic, :location => [project, asamblea, topic]
  end
end
