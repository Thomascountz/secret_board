Rails.application.routes.draw do

  resources :posts, only: [:index, :new, :create, :destroy]
  resources :users, only: [:new, :create]
  
  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  
  post '/signup', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'
end
