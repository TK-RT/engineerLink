class Article < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :article_title, :article_body, presence: true
end
