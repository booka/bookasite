class AnswersController < ApplicationController

  def show
    answer = Answer.find params[:id]
    redirect_to [answer.asamblea.project, answer.asamblea, answer.topic]
  end

  def create
    topic = Topic.find params[:topic_id]
    asamblea = topic.asamblea
    attributes = params[:answer]
    attributes[:user_id] = current_user.id
    attributes[:project_id] = asamblea.project_id
    answer = topic.answers.create(attributes)
    flash[:notice] = answer.save ? 'respuesta' : answer.errors.to_yaml
    redirect_to [asamblea.project, asamblea, topic]
  end
end
