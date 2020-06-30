class Users::QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def create
		@question = Question.new(question_params)
		@question.save
		redirect_to new_users_question_path
	end

	private
	def question_params
		params.require(:question).permit(:user_id, :question_title, :question_body)
	end
end
