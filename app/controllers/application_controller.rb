class ApplicationController < ActionController::Base

  #happens before each action in all other controllers. They inherit from this one.
  before_action :validate_user

  #?? Accessible to any view?
  #?? Do you only make them for controllers?
  
  #allows it to be accessed by the view.
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
