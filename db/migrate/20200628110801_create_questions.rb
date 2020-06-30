class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true
      t.references :programming_language, foreign_key: true
      t.string :question_title, index: true
      t.text :question_body, index: true
      t.integer :best_answer_id, 

      t.timestamps
    end
  end
end
