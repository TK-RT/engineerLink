class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :answer, null: false, index: true

      t.timestamps
    end
  end
end
