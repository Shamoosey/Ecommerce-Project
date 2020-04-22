# frozen_string_literal: true

class AddTaxToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :pst, :string
    add_column :orders, :gst, :string
  end
end
