# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@test.com',
   password: 'admintest',
)

User.create!(
	[
		{
			email: 'takahashi@gmail.com',
			password: 'takahashi',
			last_name: '高橋',
			first_name: '圭子',
			last_name_kana: 'タカハシ',
			first_name_kana: 'ケイコ',
			birthday: '1985-1-2',
			gender: '女性',
			postcode: '1112222',
			prefecture: '東京都',
			address: '新宿区',
			phone_number: '00011112222'
		},
		{
			email: 'satou@gmail.com',
			password: 'atushi',
			last_name: '佐藤',
			first_name: '厚',
			last_name_kana: 'サトウ',
			first_name_kana: 'アツシ',
			birthday: '1976-10-26',
			gender: '男性',
			postcode: '1113333',
			prefecture: '東京都',
			address: '新宿区',
			phone_number: '00011113333'
		},
		{
			email: 'saitou@gmail.com',
			password: 'saitou',
			last_name: '斎藤',
			first_name: '敬',
			last_name_kana: 'サイトウ',
			first_name_kana: 'タカシ',
			birthday: '1967-8-2',
			gender: '男性',
			postcode: '1112222',
			prefecture: '東京都',
			address: '渋谷区',
			phone_number: '00011112222'
		},
		{
			email: 'watanabe@gmail.com',
			password: 'watanabe',
			last_name: '渡辺',
			first_name: '祥太',
			last_name_kana: 'ワタナベ',
			first_name_kana: 'ショウタ',
			birthday: '1967-4-6',
			gender: '男性',
			postcode: '1112222',
			prefecture: '神奈川県',
			address: '横浜市',
			phone_number: '00011112222'
		},
	]
)