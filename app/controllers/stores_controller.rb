class StoresController < ApplicationController

  def index
    @stores = Store.all
    @most_inventory = Store.most_products[0..2]
  end

  def show
    @store = Store.find(params[:id])
    @products = @store.products
  end

  #refactored method into list class to clean up controller
  def filter
    @list = List.find(session[:list_id])
    @products = @list.products
    @stores = @list.filter_list(@products)
  end

  def my_stores
    @user = User.find(session[:user_id])
    @stores = @user.stores
  end

end
