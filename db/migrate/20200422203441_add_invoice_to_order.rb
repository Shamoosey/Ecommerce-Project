# frozen_string_literal: true

class AddInvoiceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :invoice, :string
  end
end
