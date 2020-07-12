class Company < ApplicationRecord
	has_many :evaluations, dependent: :destroy

	enum is_listing: { 上場:true, 非上場:false }

	validates :company_name, :main_office, :ceo, :foundation_date, :is_listing, presence: true
end
