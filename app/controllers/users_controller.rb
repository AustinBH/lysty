class UsersController < ApplicationController

  before_action :set_params, only: [:edit, :update, :destroy]

  def update
    if @user.update(user_params)
      redirect_to '/'
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
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    @user.delete
    @user.lists.destroy_all
    session.delete :user_id
    redirect_to '/'
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_params
    @user = User.find(session[:user_id])
  end

end
