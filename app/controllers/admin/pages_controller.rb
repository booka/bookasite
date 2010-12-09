class Admin::PagesController < Admin::AdminController
  inherit_resources
  after_filter { |controller| Activity.register(controller, current_user) }
  respond_to :html, :xml, :json
end
