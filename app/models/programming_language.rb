class ProgrammingLanguage < ApplicationRecord
	has_many :questions, dependent: :destroy
	enum is_enabled: { 有効: true, 無効: false }
end
