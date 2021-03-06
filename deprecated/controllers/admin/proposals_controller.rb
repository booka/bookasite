class Admin::ProposalsController < Admin::AdminController
  inherit_resources
  belongs_to :project
  after_filter { |controller| Activity.register(controller, current_user, @project) }
  respond_to :html, :xml, :json

  def create
    params[:call][:user_id] = current_user.id
    create!
  end

  def destroy
    destroy! { admin_project_path(@project) }
  end
end
