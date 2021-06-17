class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :version, limit: 30
      t.references :construction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
