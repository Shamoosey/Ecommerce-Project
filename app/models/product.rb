class Product < ApplicationRecord
  has_many :order_product
  belongs_to :category
  validates :name, :description, :image, :price, :stock, presence: true
  validates :price, :stock, numericality: true
  has_one_attached :image
  paginates_per 6
end
