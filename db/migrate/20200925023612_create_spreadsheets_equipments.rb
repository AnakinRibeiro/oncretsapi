class CreateSpreadsheetsEquipments < ActiveRecord::Migration[6.0]
  def change
    create_table :spreadsheets_equipments do |t|
      t.references :spreadsheet, null: false, foreign_key: true
      t.references :pump, null: false, foreign_key: true
      t.references :jack, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.integer :elongations_number

      t.timestamps
    end
  end
end
