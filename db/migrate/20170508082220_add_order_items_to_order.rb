class AddOrderItemsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :oder_item, foreign_key: true
  end
end
