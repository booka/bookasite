class AsubsController < ApplicationController
  expose(:asubs) { Asub.all }
  def index

  end
end
