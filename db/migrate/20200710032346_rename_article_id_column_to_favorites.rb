class RenameArticleIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :Article_id, :article_id
  end
end
