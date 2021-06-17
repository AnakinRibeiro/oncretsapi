class CreatePumps < ActiveRecord::Migration[6.0]
  def change
    create_table :pumps do |t|
      t.string :identification
      t.string :name
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
