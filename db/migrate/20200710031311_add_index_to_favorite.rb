class AddIndexToFavorite < ActiveRecord::Migration[5.0]
  def change
  	remove_index :favorites, column: :Article_id, name: "index_favorites_on_Article_id"
  end
end
