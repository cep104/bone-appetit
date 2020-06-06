Rails.application.routes.draw do
  resources :pets
  resources :pet_categories
  resources :recipes
  resources :users, except: [:new] do 
    resources :recipes, only: [:show, :index, :new]
    resources :pets, only: [:show, :new]
  end
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  root to: 'welcome#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
