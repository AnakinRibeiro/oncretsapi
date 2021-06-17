class AddFieldsToSpreadsheets < ActiveRecord::Migration[6.0]
  def change
    add_column :spreadsheets, :requester, :string
    add_column :spreadsheets, :resposible, :string
    add_column :spreadsheets, :comments, :string
    add_column :spreadsheets, :cable_numbering_type, :integer, default: 0
    add_column :spreadsheets, :kg_m, :float
    add_column :spreadsheets, :tip_size, :float
    change_column :spreadsheets, :status, :integer, default: 0
  end
end
