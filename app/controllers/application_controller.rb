class ApplicationController < ActionController::Base

  before_action :validate_user

  helper_method :logged_in?

  def validate_user
    if !logged_in?
      redirect_to '/'
    end
  end

  def logged_in?
    !!session[:user_id]
  end
end
