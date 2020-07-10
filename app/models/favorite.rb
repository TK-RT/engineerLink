class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :question
	belongs_to :answer, optional: true
	belongs_to :article, optional: true
end
