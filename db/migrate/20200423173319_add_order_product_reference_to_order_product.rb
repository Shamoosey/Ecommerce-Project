class AddOrderProductReferenceToOrderProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_products, :product
    add_reference :order_products, :order
  end
end
