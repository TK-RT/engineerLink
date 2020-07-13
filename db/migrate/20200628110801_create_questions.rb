class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :programming_language_id
      t.string :question_title, index: true
      t.text :question_body
      t.integer :best_answer_id

      t.timestamps
    end
  end
end
