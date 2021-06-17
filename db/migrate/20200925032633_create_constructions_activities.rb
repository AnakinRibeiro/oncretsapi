class CreateConstructionsActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :constructions_activities do |t|
      t.references :construction, null: false, foreign_key: true
      t.references :activities_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
