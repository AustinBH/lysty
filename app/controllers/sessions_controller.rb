class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:session][:name])
    if params[:session][:password] == params[:session][:password_confirmation]
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        @counter = 1
        render 'new'
      end
    else
        @counter = 2
        render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
