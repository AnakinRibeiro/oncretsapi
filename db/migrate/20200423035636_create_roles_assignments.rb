class CreateRolesAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :roles_assignments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role

      t.timestamps
    end
  end
end
