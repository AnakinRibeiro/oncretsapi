class CreateElongations < ActiveRecord::Migration[6.0]
  def change
    create_table :elongations do |t|
      t.references :cable, null: false, foreign_key: true
      t.float :elongation
      t.integer :status
      t.float :deviation
      t.float :elongation_meter
      t.references :cables_reviews_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
