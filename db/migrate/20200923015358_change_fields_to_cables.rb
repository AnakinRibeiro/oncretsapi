class ChangeFieldsToCables < ActiveRecord::Migration[6.0]
  def change
    remove_column :cables, :mask
    add_column :cables, :active_anchoring, :integer, default: 1
    add_column :cables, :passive_anchoring, :integer, default: 1
  end
end
