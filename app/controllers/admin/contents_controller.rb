class Admin::ContentsController  < Admin::AdminController
  inherit_resources
  belongs_to :project
  after_filter { |controller| Activity.register(controller, current_user) }
  respond_to :html, :xml, :json

  def create
    params[:content][:user_id] = current_user.id
    create!
  end
end
