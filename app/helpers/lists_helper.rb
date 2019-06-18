module ListsHelper

  def user_lists
    @user = User.find(session[:user_id])
    List.all.select {|list| list.user == @user}
  end
end
