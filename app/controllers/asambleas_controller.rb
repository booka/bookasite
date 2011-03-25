class AsambleasController < ApplicationController
  respond_to :html
  before_filter :load_project

  def index
    @asambleas = @project.asambleas
    respond_with @asambleas
  end

  def new
    @asamblea = Asamblea.new
    respond_with @asamblea
  end

  def show
    @asamblea = @project.asambleas.find params[:id]
    respond_with @asamblea
  end

  def create
    @asamblea = @project.create_asamblea(params[:asamblea])
    respond_with @asamblea, :location => [@project, @asamblea]
  end
end
