class Users::UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@post_image = PostImage.new
	end

	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to users_user_path(current_user.id)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to users_user_path(@user)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :gender, :postcode, :prefecture, :address, :phone_number)
	end
end
