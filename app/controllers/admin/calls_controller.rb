class Admin::CallsController < Admin::AdminController
  inherit_resources
  belongs_to :project
  defaults :resource_class => 'Call'
  after_filter { |controller| Activity.register(controller, current_user, @project) }
  respond_to :html, :xml, :json

  def create
    params[:call][:user_id] = current_user.id
    create!
  end
end
