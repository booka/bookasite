class Admin::AssetsController < Admin::AdminController
  inherit_resources
  belongs_to :project
  after_filter { |controller| Activity.register(controller, current_user, @project) }
  respond_to :html, :xml, :json

  def create
    params[:asset][:user_id] = current_user.id
    create! { admin_project_assets_path(@project)}
  end
end
