class Admins::ProgrammingLanguagesController < ApplicationController
	def index
		@programming_language = ProgrammingLanguage.new
		@programming_languages = ProgrammingLanguage.all
	end

	def create
		@programming_language = ProgrammingLanguage.new(programming_language_params)
		@programming_language.save
		redirect_to admins_programming_languages_path
	end

	def edit
		@programming_language = ProgrammingLanguage.find(params[:id])
	end

	def update
		@programming_language = ProgrammingLanguage.find(params[:id])
		@programming_language.update(programming_language_params)
		redirect_to admins_programming_languages_path
	end

	def destroy
		@programming_language = ProgrammingLanguage.find(params[:id])
		@programming_language.destroy
		redirect_to admins_programming_languages_path
	end

	private
	def programming_language_params
		params.require(:programming_language).permit(:programming_language, :is_enabled)
	end
end
