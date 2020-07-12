class Users::CompaniesController < ApplicationController
	def index
		@q = Company.ransack(params[:q])
		@companies = @q.result(distinct: true)
	end

	def show
		@company = Company.find(params[:id])
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			redirect_to users_companies_path
		else
			render :new
		end
	end

	private
	def company_params
		params.require(:company).permit(:company_name, :main_office, :ceo, :employee_number, :foundation_date, :is_listing, :hp)
	end
end
