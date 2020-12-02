class Admins::EvaluationsController < ApplicationController
	def index
		@q = Evaluation.ransack(params[:q])
		@evaluations = @q.result(distinct: true).order(created_at: :"DESC").page(params[:page])
		@company = Company.find(params[:company_id])
	end

	private
	def evaluation_params
		params.require(:evaluation).permit(:user_id, :company_id, :average, :working_time, :rewarding, :communication, :holiday, :salary, :growth_environment, :employment_type, :generation, :gender, :enrollment_period, :is_enrollment, :annual_income, :review)
	end

end
