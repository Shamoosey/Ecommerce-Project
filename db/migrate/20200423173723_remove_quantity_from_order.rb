# frozen_string_literal: true

class RemoveQuantityFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :quantity, :integer
  end
end
