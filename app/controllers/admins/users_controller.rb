class Admins::UsersController < ApplicationController
	def index
		@q = User.with_deleted.ransack(params[:q])
		@users = @q.result(distinct: true).order(created_at: :"DESC").page(params[:page])
	end
	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to admins_users_path
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :gender, :postcode, :prefecture, :address, :phone_number, :profile_image)
	end
end
