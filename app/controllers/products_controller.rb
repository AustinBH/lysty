class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    session[:product_id] = @product.id
  end

  def my_products
    @products = []
    @user = User.find(session[:user_id])
    @user.lists.each do |list|
      list.products.each do |product|
        if !@products.include?(product)
          @products << product
        end
      end
    end
    render :index
  end

end
