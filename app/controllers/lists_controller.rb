class ListsController < ApplicationController

  def index
    @lists = List.all
    render :index
  end

  def show
    @list = List.find(params[:id])
    @products = @list.products
    render :show
  end

  def edit
    @list = List.find(params[:id])
    @products = @list.products
  end

  def update
  end

  def destroy
    @list.delete
    redirect_to '/' #Not redirecting to root, redirects to @list ??????
  end
end
