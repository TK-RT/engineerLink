class Users::TopController < ApplicationController
	before_action :authenticate_user!

	def top
		@questions = Question.all.order(id: :"DESC")
		@users = User.all.order(id: :"DESC")
	end

end
