class Users::PostImagesController < ApplicationController
	def create
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		@post_image.save
		redirect_to users_user_path(current_user.id)
	end
	private
	def post_image_params
		params.require(:post_image).permit(:image)
	end
end
