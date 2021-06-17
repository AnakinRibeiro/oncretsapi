class CreateCables < ActiveRecord::Migration[6.0]
  def change
    create_table :cables do |t|
      t.references :spreadsheet, null: false, foreign_key: true
      t.references :positions_cable, null: false, foreign_key: true
      t.string :identification, limit: 20
      t.float :length
      t.float :predicted_elongation
      t.string :mask, limit: 20
      t.integer :status

      t.timestamps
    end
  end
end
