class Users::QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.user_id = current_user.id
		@question.save
		redirect_to users_questions_path
	end

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	private
	def question_params
		params.require(:question).permit(:user_id, :question_title, :question_body)
	end
end
