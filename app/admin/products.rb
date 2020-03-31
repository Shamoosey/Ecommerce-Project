ActiveAdmin.register Product do
  permit_params :name, :description, :image, :category, :price, :stock
end
