class SessionsController < ApplicationController
  skip_before_action :validate_user, only: [:new, :create]

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @counter = 1
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
