class ProductsController < ApplicationController

  def index
    products = Product.all
    @in_stock = products.select {|product| !product.out_of_stock}
    @out_of_stock = products.select {|product| product.out_of_stock}
  end

  def show
    @product = Product.find(params[:id])
    session[:product_id] = @product.id
  end

  def my_products
    @user = User.find(session[:user_id])
    products = @user.products
    @in_stock = products.select {|product| !product.out_of_stock}
    @out_of_stock = products.select {|product| product.out_of_stock}
  end

end
