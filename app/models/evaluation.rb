class Evaluation < ApplicationRecord
	belongs_to :company
	belongs_to :user

	enum employment_type: { 正社員:0,契約社員:1,派遣社員:2 }
	enum generation: { "20代":0,"30代":1,"40代":2,"50代":3,"60代":4 }
	enum gender: { "男性":0, "女性":1 }
	enum employment_period: { "3年未満":0,"3年〜10年未満":1,"10年以上":2 }

	validates :working_time, :rewarding, :communication, :holiday, :salary, :growth_environment, numericality: {
		less_than_or_equal_to: 5,
		greater_than_or_equal_to: 1
	}, presence: true
end
