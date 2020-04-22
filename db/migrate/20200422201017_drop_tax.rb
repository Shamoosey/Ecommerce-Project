# frozen_string_literal: true

class DropTax < ActiveRecord::Migration[6.0]
  def change
    drop_table :tax
  end
end
