class Admins::QuestionsController < ApplicationController
	def index
		@q = Question.ransack(params[:q])
		@questions = @q.result(distinct: true).order(created_at: :"DESC").page(params[:page])
	end
	def destroy
		question = Question.find(params[:id])
		question.destroy
		redirect_to admins_questions_path
	end

	private
	def question_params
		params.require(:question).permit(:user_id, :question_title, :question_body, :programming_language_id, :best_answer_id)
	end
end
