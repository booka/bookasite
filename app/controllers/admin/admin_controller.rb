class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  protected
  def require_admin
    redirect_to login_path unless current_user
  end
end