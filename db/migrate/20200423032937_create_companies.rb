class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :document_number
      t.boolean :is_active, default: 0

      t.timestamps
    end
  end
end
