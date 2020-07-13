class ChangeDataIsManToUser < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :is_man, :integer
  end
end
