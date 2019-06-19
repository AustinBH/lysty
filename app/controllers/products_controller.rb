class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    session[:product_id] = @product.id
  end

  def my_products
    @user = User.find(session[:user_id])
    @products = @user.products
    render :index
  end

end
