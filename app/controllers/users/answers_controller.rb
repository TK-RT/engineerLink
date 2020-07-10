class Users::AnswersController < ApplicationController
	def create
		question = Question.find(params[:question_id])
		answer = current_user.answers.new(answer_params)
		answer.question_id = question.id
		answer.save
		redirect_to users_question_path(question) 
	end

	private
	def answer_params
		params.require(:answer).permit(:answer)
	end
end
