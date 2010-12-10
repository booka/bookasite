class PagesController < ApplicationController
  def index
    @page = Page.find_by_slug('/')
    render :action => 'show'
  end

  def ccc
    redirect_to project_call_path('1-camiones-contenedores-colectivos')
  end
end
