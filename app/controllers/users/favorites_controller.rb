class Users::FavoritesController < ApplicationController
	def question_favorite_create
			question = Question.find(params[:question_id])
			favorite = current_user.favorites.new(question_id: question.id)
			favorite.save
			redirect_to users_question_path(question) 
	end

	def question_favorite_destroy
			question = Question.find(params[:question_id])
			favorite = current_user.favorites.find_by(question_id: question.id)
			favorite.destroy
			redirect_to users_question_path(question)
	end
end
