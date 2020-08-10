class Question < ApplicationRecord
	belongs_to :user
	belongs_to :programming_language
	has_many :answers, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :question_title, :question_body, presence: true
end
