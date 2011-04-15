class UsersController < ApplicationController
  respond_to :html
  before_filter :require_admin, :only => 'index'

  expose(:project) { params[:project_id] ? Project.get(params[:project_id]) : nil }

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
