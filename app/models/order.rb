# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_product
  validates :totalamount, :quantity, presence: true
  validates :totalamount, :quantity, numericality: true
end
