class Admin::BokActionsController < Admin::AdminController
  def create
    BokAction.new(params[:name], params[:bok_id])
    redirect_to params[:url]
  end
end
