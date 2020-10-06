class Users::TopController < ApplicationController
	before_action :authenticate_user!

	def top
		@questions = Question.where(best_answer_id: nil).order(created_at: :"DESC")
		@users = User.where.not(id: current_user.id).order(created_at: :"DESC")
	end

end
