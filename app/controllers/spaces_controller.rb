class SpacesController < ApplicationController
  
  def index
    @spaces = Space.all
  end
  def index
    @spaces = Space.order(:name).page(params[:page]).per(2)
  end

  def new
    @space = Space.new
  end

  def create
    Space.create(space_params)
    redirect_to root_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :address)
  end

end
