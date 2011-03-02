class Admin::AssetsController < Admin::AdminController
  before_filter :load_resources
  respond_to :html

  def create
    params[:asset][:user_id] = current_user.id
    asset = @resource.assets.build(params[:asset])
    flash[:notice] = "Fichero subido" if asset.save
    respond_with(asset, :location => (resource? ? [:admin, @project, @resource] : [:admin, @project]))
  end


  protected
  def load_resources
    @project = Project.find params[:project_id]
    @resource = Content.find params[:content_id] if params[:content_id].present?
    @resource ||= @project
  end

  def resource?
    @project != @resource
  end

end
