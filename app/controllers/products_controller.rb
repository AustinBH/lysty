class ProductsController < ApplicationController

  def index
    products = Product.all
    @in_stock = Product.in_stock(products)
    @out_of_stock = Product.out_of_stock(products)
  end

  def show
    @product = Product.find(params[:id])
    session[:product_id] = @product.id
  end

  def my_products
    @user = User.find(session[:user_id])
    products = @user.products
    @in_stock = Product.in_stock(products)
    @out_of_stock = Product.out_of_stock(products)
  end

end
