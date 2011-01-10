class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :project


  def self.report(user, project, action, model_class, model_id)
    user_id = user ? user.id : nil
    project_id = project ? project.id : nil
    Activity.create(:action => action, :model => model_class.to_s, :model_id => model_id,
      :user_id => user_id, :project_id => project_id)
  end

  def self.register(controller, user, project)
    action = controller.request.params[:action]
    if action == 'create' or action == 'update' or action == 'destroy'
      model_id = action == 'create' ? nil : controller.request.params[:id]
      Activity.report(user, project, action, controller.send(:resource_class), model_id)
    end
  end

end
