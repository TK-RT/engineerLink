class Users::PostCommentsController < ApplicationController

	def create
		article = Article.find(params[:article_id])
		comment = current_user.post_comments.new(post_comment_params)
		comment.article_id = article.id
		comment.save
		redirect_to users_article_path(article)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end

end
