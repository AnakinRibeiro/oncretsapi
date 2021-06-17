class CreateLimitsElongations < ActiveRecord::Migration[6.0]
  def change
    create_table :limits_elongations do |t|
      t.float :initial_length
      t.float :final_length
      t.float :inferior_limit
      t.float :upper_limit

      t.timestamps
    end
  end
end
