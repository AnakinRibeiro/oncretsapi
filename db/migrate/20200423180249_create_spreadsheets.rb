class CreateSpreadsheets < ActiveRecord::Migration[6.0]
  def change
    create_table :spreadsheets do |t|
      t.references :construction, null: false, foreign_key: true
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
