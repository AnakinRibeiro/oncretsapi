class AddFieldsToElongation < ActiveRecord::Migration[6.0]
  def change
    add_column :elongations, :jacking_mode, :integer, default: 1
    add_column :elongations, :correction_value, :integer
    add_column :elongations, :wedgeslip_check, :boolean, default: true
    add_column :elongations, :wedgeslip_value, :integer
  end
end