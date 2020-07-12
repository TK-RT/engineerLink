class Answer < ApplicationRecord
	belongs_to :user
	belongs_to :question
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :answer, presence: true
end
