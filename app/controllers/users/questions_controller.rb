class Users::QuestionsController < ApplicationController
	before_action :authenticate_user!

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.user_id = current_user.id
		if @question.save
			redirect_to users_question_path(@question)
		else
			render :new
		end
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
		@q = Question.ransack(params[:q])
		@questions = @q.result(distinct: true).page(params[:page]).order(id: :DESC)
		@programming_languages = ProgrammingLanguage.all
	end

	def genre_index
		@q = Question.ransack(params[:q])
		@questions = @q.result(distinct: true).page(params[:page])
		@programming_languages = ProgrammingLanguage.all
		@programming_language = ProgrammingLanguage.find(params[:id])
	end

	def show
		@question = Question.find(params[:id])
		@answer = Answer.new
	end

	private
	def question_params
		params.require(:question).permit(:user_id, :question_title, :question_body, :programming_language_id, :best_answer_id)
	end
end
