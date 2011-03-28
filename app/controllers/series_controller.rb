class SeriesController < ApplicationController
  respond_to :html

  expose(:series) { Serie.all }
  expose(:serie)
  # index
  expose(:page) { Page.get('/') }
  expose(:info) { Page.get('info') }

  def index
  end

  def show
  end
end
