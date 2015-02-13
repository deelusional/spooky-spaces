class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@space = Space.find(params[:space_id])
		@space.comments.create(comment_params.merge(:user => current_user))
		redirect_to space_path(@space)
	end

	private

	def comment_params
      params.require(:comment).permit(:message, :rating)
	end
end
