class ProductController < ApplicationController
  def index
    @products = Product.all.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @product_results = Product.joins(:category).where('products.name LIKE ? AND products.category_id LIKE ?', "%#{params[:search_term]}%", "%#{params[:category_id]}%").page params[:page]
  end
end
