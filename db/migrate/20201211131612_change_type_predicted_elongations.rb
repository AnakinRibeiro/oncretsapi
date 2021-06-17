class ChangeTypePredictedElongations < ActiveRecord::Migration[6.0]
  def change
    change_column :cables, :predicted_elongation, :integer
  end
end
