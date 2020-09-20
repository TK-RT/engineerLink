class Users::UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.page(params[:page])
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
		if @user == current_user
			@user.update(user_params)
			redirect_to users_user_path(@user)
		else
			render :edit
		end
	end

	def search
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
	end

	def destroy
		@user = User.find(params[:id])
		if @user == current_user
			@user.destroy
			redirect_to root_path
		else
			redirect_to users_user_path(@user)
		end
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :gender, :postcode, :prefecture, :address, :phone_number, :profile_image)
	end
end
