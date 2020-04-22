# frozen_string_literal: true

class ChangeGstAndPstToBeDecimalsInOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :gst, :decimal
    change_column :orders, :pst, :decimal
  end
end
