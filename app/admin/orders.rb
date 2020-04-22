# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :customer_id, :totalamount, :subtotal, :gst, :pst, :quantity
end
