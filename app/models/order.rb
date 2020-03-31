class Order < ApplicationRecord
  has_many :order_product
  belongs_to :customer, foreign_key: "customer_id"
  validates :totalamount, :quantity, presence: true
end
