# Send invitation mail to users
class InvitationsController < ApplicationController
  # belongs_to :user
  expose(:user) { User.find params[:user_id]}

  def new
    UserMailer.invitation_email(user).deliver
  end
end
