class Admin::ActivitiesController < Admin::AdminController
  inherit_resources
  respond_to :html, :xml, :json
  actions :index
end
