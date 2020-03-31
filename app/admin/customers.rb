ActiveAdmin.register Customer do
  permit_params :name, :address, :postalcode, :city, :province, :country, :email, :password
end
