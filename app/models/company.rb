class Company < ApplicationRecord
	has_many :evaluations, dependent: :destroy

	enum is_listing: { 上場:true, 非上場:false }
end
