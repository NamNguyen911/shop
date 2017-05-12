class AddNumberToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :sub_total, :decimal, precision: 12, scale: 3
    add_column :orders, :tax, :decimal, precision: 12, scale: 3
    add_column :orders, :shipping, :decimal, precision: 12, scale: 3
  end
end
