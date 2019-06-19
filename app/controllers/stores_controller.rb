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
        if store.products.include?(product)
          @stores << store
        end
      end
    end
  end

end
