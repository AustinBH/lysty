class ListsController < ApplicationController

  before_action :validate_list, only: [:show, :edit, :update]

  def index
    @user = User.find(session[:user_id])
    @lists = List.all.select {|list| list.user == @user}
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
