class Users::TopController < ApplicationController
	before_action :authenticate_user!

	def top
		@questions = Question.all
	end

end
