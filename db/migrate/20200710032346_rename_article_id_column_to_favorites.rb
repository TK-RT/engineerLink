class RenameArticleIdColumnToFavorites < ActiveRecord::Migration[5.0]
  def change
  	rename_column :favorites, :Article_id, :article_id
  end
end
