Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  resources :posts, only: [:index, :new, :create, :destroy]
  resources :users, only: [:new, :create]
  
  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'
end
