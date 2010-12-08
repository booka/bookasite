class Activity < ActiveRecord::Base
  belongs_to :user
  
  def self.register(controller, user)
    action = controller.request.params[:action]
    if action == 'create' or action == 'update' or action == 'destroy'
      model_id = action == 'create' ? nil : controller.request.params[:id]
      Activity.create(:action => action, :model => controller.send(:resource_class), :model_id => model_id, :user_id => user.id)
    end
  end

end
