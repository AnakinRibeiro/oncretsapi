class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number, limit: 20
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
