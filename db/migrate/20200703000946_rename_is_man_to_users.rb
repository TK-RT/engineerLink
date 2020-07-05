class RenameIsManToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :is_man, :gender
  end
end
