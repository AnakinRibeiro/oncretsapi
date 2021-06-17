class CreateJacksUses < ActiveRecord::Migration[6.0]
  def change
    create_table :jacks_uses do |t|
      t.references :jack, null: false, foreign_key: true
      t.references :spreadsheet, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.integer :elongations_number

      t.timestamps
    end
  end
end
