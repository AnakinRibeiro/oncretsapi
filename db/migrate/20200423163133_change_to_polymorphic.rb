class ChangeToPolymorphic < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :addresseable, polymorphic: true, index: true
    add_reference :phones, :phonesable, polymorphic: true, index: true
  end
end
