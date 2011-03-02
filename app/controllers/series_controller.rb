class SeriesController < ApplicationController
  layout 'grid'

  respond_to :html

  def index
    @series = Series.all
    @page = Page.get('/')
    @info = Page.get('info')

    respond_with @series
  end

  def show
    @series = Series.find params[:id]
    respond_with @series
  end
end
