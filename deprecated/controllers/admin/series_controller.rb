class Admin::SeriesController < Admin::AdminController
  inherit_resources
  #after_filter { |controller| Activity.register(controller, current_user, @serie) }
  respond_to :html, :xml, :json


end
