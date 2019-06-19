Rails.application.routes.draw do
  resources :lists, only: [:show, :edit, :update, :new, :create]
  resources :stores, only: [:index, :show]
  resources :products, only: [:index, :show]
  root to: 'pages#home'
  delete '/delete_list', to: 'lists#destroy', as: 'delete_list'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/my_account', to: 'users#edit'
  patch '/my_account', to: 'users#update'
  delete '/delete_account', to: 'users#destroy', as: 'delete_account'
  post '/delete_product', to: 'lists#remove_product', as: 'delete_product'
  post '/add_product', to: 'lists#add_product'
  get '/filter_stores', to: 'stores#filter'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
