class SpacesController < ApplicationController
  
  def index
    @spaces = Space.all
  end
  def index
    @spaces = Space.order(:name).page(params[:page]).per(1)
  end

  def new
    
  end

end
