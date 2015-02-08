class SpacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  
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
    current_user.spaces.create(space_params)
    redirect_to root_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :address)
  end

end
