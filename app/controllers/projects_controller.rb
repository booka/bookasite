class ProjectsController < ApplicationController
  def index
    @page = Page.find_by_slug('/')
    @calls = Call.all
  end
end
