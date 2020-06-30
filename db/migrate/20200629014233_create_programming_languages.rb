class CreateProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :programming_languages do |t|
      t.string :programming_language, null: false
      t.boolean :is_enabled, null: false, default: true

      t.timestamps
    end
  end
end
