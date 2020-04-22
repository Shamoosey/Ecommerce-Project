# frozen_string_literal: true

class DropCustomer < ActiveRecord::Migration[6.0]
  def change
    drop_table :customers
  end
end
