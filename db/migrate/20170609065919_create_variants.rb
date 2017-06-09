class CreateVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
      t.string :name
      t.string :values, array: true

      t.timestamps
    end
  end
end
