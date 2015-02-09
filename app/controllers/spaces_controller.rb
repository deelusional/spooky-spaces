class SpacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit]
  
  def index
    @spaces = Space.all
  end
  def index
    @spaces = Space.order(:name).page(params[:page]).per(4)
  end

  def new
    @space = Space.new
  end

  def create
    current_user.spaces.create(space_params)
    redirect_to root_path
  end

  def show
    @space = Space.find(params[:id])
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    @space.update_attributes(space_params)
    redirect_to root_path
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to root_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :address)
  end

end
