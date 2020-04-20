class ProductController < ApplicationController
  before_action :initalize_session
  before_action :load_cart

  def index
    @products = Product.all.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @product_results = Product.joins(:category).where('products.name LIKE ? AND products.category_id LIKE ?', "%#{params[:search_term]}%", "%#{params[:category_id]}%").page params[:page]
  end

  def add_to_cart
    id =  params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id =  params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end

  def initalize_session
    session[:cart] ||= []
  end
end
