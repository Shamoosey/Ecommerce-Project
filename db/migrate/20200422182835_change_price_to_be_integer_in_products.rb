# frozen_string_literal: true

class ChangePriceToBeIntegerInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :integer
  end
end
