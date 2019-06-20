#Modules are libraries of methods
module ListsHelper

  #? . HOW is user_lists used in the Products show view without including it in your class?
  #? Is it assumed my ruby when you keep it in the same controller/view ?
  #? When would you put a method in the helpers folder and not in the model's class file??
  #the Users class has helper methods, not the users_helper.rb. Is there a reason why?
  def user_lists
    @user = User.find(session[:user_id])
    List.all.select {|list| list.user == @user}
  end
end
