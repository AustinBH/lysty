class ListsController < ApplicationController

  before_action :validate_list, only: [:show, :edit, :update]
  before_action :list_redirect, only: [:show, :edit]

  def index
    @user = User.find(session[:user_id])
    @lists = @user.lists
    #If user has no list, set @no_lists,
    #which will be displayed on index view.
    if @lists == []
      @no_lists = "You don't have any lists."
    #Otherwise, user's lists will be showed and
    #@no_lists will be an empty string and not show.
    end

    render :index
  end

  # def show
  #   list_redirect
  # end
  #
  # def edit
  #   list_redirect
  # end

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
    #finding the current user
    @user = User.find(session[:user_id])
    @list = List.new(list_params)
    #setting the association of new list to current user
    @list.user = @user
    if @list.save
<<<<<<< HEAD
      #lists_path = lists index
=======
      if request.referrer.include?("products/")
        @product = Product.find(session[:product_id])
        ListProduct.create(list: @list, product: @product)
        flash[:message] = "Saved"
        redirect_to @product and return
      end
>>>>>>> 58ac4a793395afc4de99b03aa193b0fe50da5a54
      redirect_to lists_path
    else
      render :new
    end
  end

  def add_product
    #Finding the @product and @list to pass through to create a ListProduct,
    #which will be displayed on the list.
    @product = Product.find(session[:product_id])
    @list = List.find(params[:lists][:list_id])
    ListProduct.create(list: @list, product: @product)
    redirect_to @list
  end

  def remove_product
    @list = List.find(session[:list_id])
    @product = Product.find(params[:id])
    @list_product = ListProduct.find_by(list: @list, product: @product)
    @list_product.delete
    redirect_to edit_list_path(@list)
  end

  def destroy
    @list = List.find(session[:list_id])
    @list.delete
    redirect_to '/'
  end

  private

  def validate_list
    @list = List.find(params[:id])
    @user = User.find(session[:user_id])
    if @list.user == @user
      @products = @list.products
    else
      @list = ""
      #setting @products technically isn't needed, user will be redirected before it's every used
      @products = []
    end
  end

  def list_params
    params.require(:list).permit(:title)
  end

  def list_redirect
    if @list == ""
      redirect_to '/lists'
    else
      session[:list_id] = @list.id
    end
  end

end
