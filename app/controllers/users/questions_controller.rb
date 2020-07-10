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

	def edit
		@question = Question.find(params[:id])
		if @question.user != current_user
			redirect_to users_question_path(@question)
		end
	end

	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			redirect_to users_question_path(@question)
		else
			render :edit
		end
	end

	def best_answer
		@question = Question.find(params[:id])
		@question.best_answer_id = params[:best_answer_id]
		if @question.save
			redirect_to users_question_path(@question)
		else
			render :show
		end
	end

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
		@answer = Answer.new
	end

	private
	def question_params
		params.require(:question).permit(:user_id, :question_title, :question_body, :best_answer_id)
	end
end
