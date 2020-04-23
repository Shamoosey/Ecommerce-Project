# frozen_string_literal: true

ActiveAdmin.register OrderProduct do
  permit_params :subtotal, :product_id, :order_id, :quantity
end
