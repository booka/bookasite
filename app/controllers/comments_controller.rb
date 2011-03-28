class CommentsController < ApplicationController
  def create
    if params[:topic_id].present?
      parent = Topic.find params[:topic_id]
      topic = parent
    elsif params[:answer_id].present?
      parent = Answer.find params[:answer_id]
      topic = parent.topic
    end

    asamblea = parent.asamblea
    attributes = params[:comment]
    attributes[:user_id] = current_user.id
    attributes[:project_id] = asamblea.project_id
    attributes[:title] = parent.title
    comment = parent.comments.create(attributes)
    flash[:notice] = comment.save ? 'comentario' : comment.errors.to_yaml
    redirect_to [asamblea.project, asamblea, topic]
  end
end
