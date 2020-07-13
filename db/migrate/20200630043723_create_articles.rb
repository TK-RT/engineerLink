class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :article_title, null: false, index: true
      t.text :article_body, null: false
      t.references :programming_language, foreign_key: true

      t.timestamps
    end
  end
end
