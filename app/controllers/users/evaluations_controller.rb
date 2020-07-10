class Users::EvaluationsController < ApplicationController
	def new
		@evaluation = Evaluation.new
	end
	def next
		session[:working_time] = evaluation_params[:working_time].to_f
		session[:rewarding] = evaluation_params[:rewarding].to_f
		session[:communication] = evaluation_params[:communication].to_f
		session[:holiday] = evaluation_params[:holiday].to_f
		session[:salary] = evaluation_params[:salary].to_f
		session[:growth_environment] = evaluation_params[:growth_environment].to_f
		@evaluation = Evaluation.new
	end
	def create
		evaluation = Evaluation.new(
			working_time: session[:working_time],
			rewarding: session[:rewarding],
			communication: session[:communication],
			holiday: session[:holiday],
			salary: session[:salary],
			growth_environment: session[:growth_environment],
			average: (session[:working_time] + session[:rewarding] + session[:communication] + session[:holiday] + session[:salary] + session[:growth_environment]) / 6,
			employment_type: evaluation_params[:employment_type],
			generation: evaluation_params[:generation].to_i,
			gender: evaluation_params[:gender],
			enrollment_period: evaluation_params[:enrollment_period].to_i,
			is_enrollment: evaluation_params[:is_enrollment],
			annual_income: evaluation_params[:annual_income],
			review: evaluation_params[:review]
			)
		company = Company.find(params[:company_id])
		evaluation.user_id = current_user.id
		evaluation.company_id = company.id
		evaluation.save!
		redirect_to users_companies_path
	end

	private
	def evaluation_params
		params.require(:evaluation).permit(:user_id, :company_id, :average, :working_time, :rewarding, :communication, :holiday, :salary, :growth_environment, :employment_type, :generation, :gender, :enrollment_period, :is_enrollment, :annual_income, :review)
	end
end
