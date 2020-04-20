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
    id = params[:id].to_i
    quantity = 1
    item = { id => quantity }
    session[:cart].merge!(item) unless session[:cart].include?(item)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id]
    session[:cart].delete(id)
    redirect_to root_path
  end

  def load_cart
    @cart = session[:cart]
  end

  def increment
    id = params[:id]
    session[:cart][id] += 1
    redirect_to root_path
  end

  def decrement
    id = params[:id]
    session[:cart][id] -= 1
    redirect_to root_path
  end

  def initalize_session
    session[:cart] ||= {}
  end

end
