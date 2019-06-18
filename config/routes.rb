Rails.application.routes.draw do
  resources :lists
  resources :stores, only: [:index, :show]
  resources :products, only: [:index, :show]
  root to: 'pages#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/my_account', to: 'users#edit'
  patch '/my_account', to: 'users#update'
  delete '/delete_account', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
