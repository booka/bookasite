class BoksController < ApplicationController
  layout nil
  
  def show
    @bok = Bok.find params[:id]
  end
end
