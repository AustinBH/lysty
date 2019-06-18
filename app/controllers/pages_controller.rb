class PagesController < ApplicationController
  skip_before_action :validate_user
  def home
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
      @no_lists = ""
      if @user.lists != []
        @lists = @user.lists
      else
        @lists = []
        @no_lists = "You don't have any lists."
      end
      render 'logged_in'
    end
  end

end
