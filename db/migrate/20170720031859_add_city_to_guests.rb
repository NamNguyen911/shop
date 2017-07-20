class AddCityToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :city, :string
  end
end
