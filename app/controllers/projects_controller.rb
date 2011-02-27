class ProjectsController < ApplicationController
  layout 'grid1140'

  def index
    @page = Page.get('/')
    @info = Page.get('info')
  end
end
