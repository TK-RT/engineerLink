class Company < ApplicationRecord
	has_many :evaluations, dependent: :destroy
end
