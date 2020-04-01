ActiveAdmin.register Product do
  permit_params :name, :description, :image, :category, :price, :stock, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
