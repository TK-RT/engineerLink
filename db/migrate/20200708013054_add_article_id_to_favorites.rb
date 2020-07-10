class AddArticleIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :Article, foreign_key: true
  end
end
