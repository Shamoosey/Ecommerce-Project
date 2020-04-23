# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_products
  validates :totalamount, presence: true
  validates :totalamount, numericality: true
end
