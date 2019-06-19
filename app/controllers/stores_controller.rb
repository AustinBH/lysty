class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def filter
    @stores = []
    stores = Store.all
    @list = List.find(session[:list_id])
    @products = @list.products

    @products.each do |product|
      stores.each do |store|
        if store.products.include?(product) && !@stores.include?(store)
          @stores << store
        end
      end
    end
  end

  def my_stores
    @stores = []
    @user = User.find(session[:user_id])
    @user.lists.each do |list|
      list.products.each do |product|
        product.stores.each do |store|
          if !@stores.include?(store)
          @stores << store
          end
        end
      end
    end
    render :index
  end

end
