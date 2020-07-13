class AddGenderToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :gender, :integer, null: false, default: 0
  end
end
