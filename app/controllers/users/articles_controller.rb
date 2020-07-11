class Users::ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		@article.save
		redirect_to users_article_path(@article)
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@post_comment = PostComment.new
	end

	private
	def article_params
		params.require(:article).permit(:user_id, :article_title, :article_body)
	end
end
