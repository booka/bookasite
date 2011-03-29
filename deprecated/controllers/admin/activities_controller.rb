class Admin::ActivitiesController < Admin::AdminController
  inherit_resources
  respond_to :html, :xml, :json
  actions :index

  def index
    @activities = Activity.system
    index!
  end
end
