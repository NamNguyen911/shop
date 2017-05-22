class AddAttrToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :slogan, :string
    add_column :categories, :description, :text
  end
end
