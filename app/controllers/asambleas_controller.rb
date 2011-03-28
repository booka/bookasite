class AsambleasController < ApplicationController
  before_filter :require_user, :except => [:show, :index]
  respond_to :html
  expose(:project)
  expose(:asambleas) { project.asambleas }
  expose(:asamblea)

  def index
  end

  def new
  end

  def show
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
