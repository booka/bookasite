class UsersController < ApplicationController
  respond_to :html
  #edit_require_user
  expose(:project) { params[:project_id] ? Project.find(params[:project_id]) : nil }

  # index
  expose(:users) { project.present? ? project.users : User.all }

  # show, edit
  expose(:user)

  def index
  end

  def show
  end

  def edit
  end

  def update
    user.update_attributes(params[:user])
    respond_with user, :location => user
  end

  def destroy
    user.destroy
    respond_with user, :location => users_path
  end
end
