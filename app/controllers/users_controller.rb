class UsersController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update, :destroy]

  # def show
  #   set_params
  #   render :show
  # end

  # def edit
  #   set_params
  #   render :edit
  # end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end

  def destroy
    @user.delete
    redirect_to '/'
  end

  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_params
    @user = User.find(params[:id])
  end

end
