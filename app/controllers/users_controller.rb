class UsersController < ApplicationController
  expose(:project)

  # index
  expose(:users) { project.users }

  def index

  end
end
