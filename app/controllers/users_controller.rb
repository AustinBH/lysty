class UsersController < ApplicationController

  skip_before_action :validate_user, only: [:new, :create]
  before_action :set_params, only: [:edit, :update, :destroy]

  def update
    byebug
    if @user.update(user_params) && params[:user][:password] == params[:user][:password_confirmation]
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
    if @user.save && params[:user][:password] == params[:user][:password_confirmation]
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
