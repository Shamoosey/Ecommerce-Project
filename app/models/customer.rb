class Customer < ApplicationRecord
  has_many :order
  validates :name, :address, :postalcode, :city, :province, :country, :email, :password, presence: true
end
