class PagesController < ApplicationController ###What does this do???
  skip_before_action :validate_user
  def home
    @home_page = request.env['PATH_INFO']
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
      @no_lists = ""

      render 'logged_in_home'
    end
  end

end
