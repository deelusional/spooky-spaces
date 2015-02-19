class PhotosController < ApplicationController
	
	def create
      @space = Space.find(params[:space_id])
      @space.photos.create(photo_params)
      redirect_to space_path(@space)
	end

	private

	def photo_params
		params.require(:photo).permit(:picture, :caption)
	end

end

