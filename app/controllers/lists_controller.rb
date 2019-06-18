class ListsController < ApplicationController

  before_action :validate_list, only: [:show, :edit, :update]

  def index
    @user = User.find(session[:user_id])
    user_lists
    render :index
  end

  def edit
    session[:list_id] = @list.id
  end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end


  def new
    @list = List.new
    render :new
  end

  def create
    @user = User.find(session[:user_id])
    @list = List.new(list_params)
    @list.user = @user
    if @list.save
      redirect_to '/'
    else
      render :new
    end
  end
  
  def add_product
    @product = Product.find(session[:product_id])
    @list = List.find(params[:lists][:list_id])
    ListProduct.create(list: @list, product: @product)
    redirect_to @list
  end

  def remove_product
    @list = List.find(session[:list_id])
    @product = Product.find(params[:lists][:product])
    @list_product = ListProduct.find_by(list: @list, product: @product)
    @list_product.delete
    redirect_to edit_list_path(@list)
  end

  def destroy
    @list = List.find(session[:list_id])
    @list.delete
    redirect_to '/' #Not redirecting to root, redirects to @list ??????
  end

  private

  def validate_list
    @list = List.find(params[:id])
    @user = User.find(session[:user_id])
    if @list.user == @user
      @products = @list.products
    else
      @list = ""
      @products = []
    end
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
