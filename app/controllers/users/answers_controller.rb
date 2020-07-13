class Users::AnswersController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@question = Question.find(params[:question_id])
		@answer = current_user.answers.new(answer_params)
		@answer.question_id = @question.id
		if @answer.save
			redirect_to users_question_path(@question)
		else
			render template: "users/questions/show"
		end
	end

	private
	def answer_params
		params.require(:answer).permit(:answer)
	end
end
