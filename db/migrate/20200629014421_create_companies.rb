class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :company_name, null: false, index: true
      t.string :main_office, null: false, index: true
      t.string :ceo, null: false
      t.integer :employee_number
      t.date :foundation_date, null: false
      t.boolean :is_listing, null: false, default: true
      t.string :hp

      t.timestamps
    end
  end
end
