class CreateSalesTax < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_taxes do |t|
      t.string :Province
      t.decimal :GST
      t.decimal :PST
    end
  end
end
