class NotificationsController < ApplicationController
  expose(:notifications) { Notification.all }
  def index

  end
end
