class AddIsActiveToConstructions < ActiveRecord::Migration[6.0]
  def change
    add_column :constructions, :is_active, :boolean, default: true
  end
end
