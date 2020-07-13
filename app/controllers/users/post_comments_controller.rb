class Users::PostCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@article = Article.find(params[:article_id])
		@post_comment = current_user.post_comments.new(post_comment_params)
		@post_comment.article_id = @article.id
		if @post_comment.save
			redirect_to users_article_path(@article)
		else
			render template: "users/articles/show"
		end
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end

end
