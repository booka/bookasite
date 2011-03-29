class VersionsController < ApplicationController
  before_filter :require_super
  expose(:versions) { Version.order('created_at DESC') }

  def index

  end
end

