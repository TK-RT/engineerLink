class Users::TopController < ApplicationController
	before_action :authenticate_user!

	def top
		@questions = Question.all.order(created_at: :"DESC")
		@users = User.all.order(created_at: :"DESC")
	end

end
