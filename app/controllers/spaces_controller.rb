class SpacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @spaces = Space.all
  end
  def index
    @spaces = Space.order(:name).page(params[:page]).per(5)
  end

  def new
    @space = Space.new
  end

  def create
    @space = current_user.spaces.create(space_params)
    if @space.valid?
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @space = Space.find(params[:id])
  end

  def edit
    @space = Space.find(params[:id])

    if @space.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end
  end

  def update
    @space = Space.find(params[:id])
    
    if @space.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @space.update_attributes(space_params)
    if @space.valid?
      redirect_to root_path
    else
      render :edit, :status => :unprocessable_entity  
    end
  end

  def destroy
    @space = Space.find(params[:id])
    if @space.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @space.destroy
    redirect_to root_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :address)
  end

end
