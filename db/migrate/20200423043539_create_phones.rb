class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.references :phones_type, null: false, foreign_key: true
      t.string :phone, limit: 30

      t.timestamps
    end
  end
end
