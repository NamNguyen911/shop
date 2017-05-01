class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :description, :text
    add_column :products, :price, :decimal
  end
end
