class EmailNotificationsController < ApplicationController
  expose(:user) { User.find params[:user_id] }
  expose(:notifications) { user.notifications.pending }

  def create
    UserMailer.notification_email(user, notifications).deliver
    #notifications.each {|n| n.update_attribute(:notified, true)}
  end
end
