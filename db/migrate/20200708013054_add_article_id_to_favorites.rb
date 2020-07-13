class AddArticleIdToFavorites < ActiveRecord::Migration[5.0]
  def change
    add_column :favorites, :article_id, :integer
  end
end
