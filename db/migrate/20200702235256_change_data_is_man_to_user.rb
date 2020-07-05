class ChangeDataIsManToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :is_man, :integer
  end
end
