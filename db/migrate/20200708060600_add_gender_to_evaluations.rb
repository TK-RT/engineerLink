class AddGenderToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :gender, :integer, null: false, default: 0
  end
end
