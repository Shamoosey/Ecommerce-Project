class ChangeSalesTaxToTax < ActiveRecord::Migration[6.0]
  def change
    rename_table :sales_taxes, :tax
  end
end
