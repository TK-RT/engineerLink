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

	def article_favorite_create
		article = Article.find(params[:article_id])
		favorite = current_user.favorites.new(article_id: article.id)
		favorite.save!
		redirect_to users_article_path(article) 
	end

	def article_favorite_destroy
		article = Article.find(params[:article_id])
		favorite = current_user.favorites.find_by(article_id: article.id)
		favorite.destroy
		redirect_to users_article_path(article)
	end
end
