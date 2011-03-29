class Admin::PermissionsController < Admin::AdminController
  before_filter :load_source
  respond_to :html

  def index
    @permissions = @source.permissions
  end

  def new
    @permission = @source.permissions.build
  end

  def edit
    @permission = @source.permissions.find params[:id]
  end

  def update
    @permission = @source.permissions.find params[:id]
    if @permission.update_attributes(params[:permission])
      redirect_to [:admin, @source]
    else
      render :action => 'edit'
    end
  end

  def create
    @permission = @source.permissions.build(params[:permission])
    if @permission.save
      redirect_to [:admin, @source]
    else
      render :action => 'new'
    end
  end

  protected

  def load_source
    @user = @source = User.find(params[:user_id]) if params[:user_id].present?
    @project = @source = Project.find(params[:project_id]) if params[:project_id].present?
  end
end
