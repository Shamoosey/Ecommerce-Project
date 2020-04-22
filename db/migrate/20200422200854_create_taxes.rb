class CreateTaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :taxes do |t|
      t.string :province
      t.decimal :gst
      t.decimal :pst

      t.timestamps
    end
  end
end
