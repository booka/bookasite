class AsambleasController < ApplicationController
  before_filter :load_project

  def index
    @asambleas = @project.asambleas
  end
end
