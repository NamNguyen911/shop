class AddQuantityDefaultToProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :quantity, :integer, default: 0
  end
end
