class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :is_active, :boolean, default: true
    add_reference :users, :role, foreign_key: true
  end
end
