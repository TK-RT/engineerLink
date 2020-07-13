class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.float :average, null: false
      t.float :working_time, null: false
      t.float :rewarding, null: false
      t.float :communication, null:false
      t.float :holiday, null: false
      t.float :salary, null: false
      t.float :growth_environment, nill: false
      t.integer :employment_type, null:false, default: 0
      t.integer :generation, null: false, default: 0
      t.integer	:enrollment_period, null: false, default: 0
      t.boolean :is_enrollment, null: false, default: true
      t.integer :annual_income, null: false
      t.text :review, null: false

      t.timestamps
    end
  end
end
