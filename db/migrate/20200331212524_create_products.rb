class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :category
      t.decimal :price
      t.decimal :stock

      t.timestamps
    end
  end
end
