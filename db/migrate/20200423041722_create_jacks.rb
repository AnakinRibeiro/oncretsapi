class CreateJacks < ActiveRecord::Migration[6.0]
  def change
    create_table :jacks do |t|
      t.string :identification, limit: 20
      t.string :name
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
