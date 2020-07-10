class Users::UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@post_image = @user.post_images
	end

	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to users_user_path(current_user.id)
		end
		@post_image = PostImage.new
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to users_user_path(@user)
		else
			render :edit
		end
	end

	def search
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :gender, :postcode, :prefecture, :address, :phone_number, :profile_image)
	end
end
