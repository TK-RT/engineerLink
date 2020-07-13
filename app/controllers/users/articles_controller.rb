class Users::ArticlesController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		if @article.save
			redirect_to users_article_path(@article)
		else
			render :new
		end
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@post_comment = PostComment.new
	end

	def edit
		@article = Article.find(params[:id])
		if @article.user != current_user
			redirect_to users_article_path(@article)
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to users_article_path(@article)
		else
			render :edit
		end
	end

	private
	def article_params
		params.require(:article).permit(:user_id, :article_title, :article_body)
	end
end
