class SessionsController < ApplicationController
  skip_before_action :validate_user, only: [:new, :create]

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id #creates a new session when set?
      redirect_to '/'
    else
      flash[:message] = "Invalid username/password combination!" #is there a different way to set errors?
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
