class PagesController < ApplicationController
  def index
    @page = Page.find_by_slug('/')
    render :action => 'show'
  end
end
