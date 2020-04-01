class Product < ApplicationRecord
  has_many :order_product
  validates :name, :description, :image, :category, :price, :stock, presence: true
  has_one_attached :image
end
