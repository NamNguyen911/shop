class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :city
      t.string :email
      t.text :note

      t.timestamps
    end
  end
end
