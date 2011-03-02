class Admin::AssetsController < Admin::AdminController
  before_filter :load_resources
  respond_to :html

  def new
    @asset = @resource.assets.build
    respond_with @asset
  end

  def edit
    @asset = @resource.assets.find params[:id]
    respond_with @asset
  end

  def create
    params[:asset][:user_id] = current_user.id
    params[:asset][:project_id] = @project.id
    @asset = @resource.assets.build(params[:asset])
    flash[:notice] = "Fichero subido" if @asset.save
    url = resource? ? [:admin, @project, @resource] : [:admin, @project]
    respond_with(@asset, :location => url)
  end

  def destroy
    @asset = @resource.assets.find params[:id]
    flash[:notice] = "Fichero borrado" if @asset.destroy
    url = resource? ? [:admin, @project, @resource] : [:admin, @project]
    respond_with(@asset, :location => url)
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
