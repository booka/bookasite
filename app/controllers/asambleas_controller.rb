class AsambleasController < ApplicationController
  before_filter :require_user, :except => [:show, :index]
  respond_to :html

  expose(:project) { Project.get params[:project_id] }
  expose(:asambleas) { project.asambleas }
  expose(:asamblea)

  def index
  end

  def new
  end

  def show
    if params[:project_id].blank?
      asamblea = Asamblea.find params[:id]
      redirect_to [asamblea.project,asamblea]
    end
  end

  def edit
  end

  def create
    params[:asamblea][:user_id] = current_user.id
    asamblea = project.asambleas.create(params[:asamblea])
    respond_with asamblea, :location => [project, asamblea]
  end

  def update
    asamblea.update_attributes(params[:asamblea])
    respond_with @asamblea, :location => [project, asamblea]
  end

  protected
  def find_asamblea
    @asamblea = @project.asambleas.find params[:id]
  end
end
