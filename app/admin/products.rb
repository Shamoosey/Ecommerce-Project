ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock, :image, :categories_id

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :categories_id, as: :select, collection: Category.all.collect { |category| [category.name, category.id] }
      f.input :image, as: :file
    end
    f.actions
  end
end
