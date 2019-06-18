Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :edit, :update, :new, :create]
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
