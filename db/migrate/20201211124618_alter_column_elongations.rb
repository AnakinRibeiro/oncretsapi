class AlterColumnElongations < ActiveRecord::Migration[6.0]
  def change
    change_column :elongations, :elongation, :integer
  end
end
