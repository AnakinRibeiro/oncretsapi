class CreatePositionsCables < ActiveRecord::Migration[6.0]
  def change
    create_table :positions_cables do |t|
      t.string :name

      t.timestamps
    end
  end
end
