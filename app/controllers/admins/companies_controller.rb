class Admins::CompaniesController < ApplicationController
	def index
		@q = Company.ransack(params[:q])
		@companies = @q.result(distinct: true).order(created_at: :"DESC").page(params[:page])
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])
		@company.update(company_params)
		redirect_to admins_companies_path
	end

	def destroy
		company = Company.find(params[:id])
		company.destroy
		redirect_to admins_companies_path
	end

	private
	def company_params
		params.require(:company).permit(:company_name, :main_office, :ceo, :employee_number, :foundation_date, :is_listing, :hp)
	end
end
