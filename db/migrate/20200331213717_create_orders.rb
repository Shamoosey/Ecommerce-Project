class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :totalamount
      t.decimal :quantity

      t.timestamps
    end
  end
end
