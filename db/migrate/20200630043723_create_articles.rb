class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :article_title, null: false, index: true
      t.text :article_body, null: false
      t.integer :programming_language_id
      t.integer :user_id

      t.timestamps
    end
  end
end
