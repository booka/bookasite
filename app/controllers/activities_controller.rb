class ActivitiesController < ApplicationController
  expose(:activities) { Activity.all }

  def index

  end

end

