class Admins::ArticlesController < ApplicationController
	def index
		@q = Article.ransack(params[:q])
		@articles = @q.result(distinct: true).order(created_at: :"DESC").page(params[:page])
	end
	def destroy
		article = Article.find(params[:id])
		article.destroy
		redirect_to admins_articles_path
	end

	private
	def article_params
		params.require(:article).permit(:user_id, :article_title, :article_body)
	end
end
