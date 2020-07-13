class RenameIsManToUsers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :is_man, :gender
  end
end
