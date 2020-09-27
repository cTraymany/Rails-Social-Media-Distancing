Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#index'

  get 'login' => 'sessions#new'
  get 'signup' => 'users#new'

  post 'login' => 'sessions#create'
  post 'signup' => 'users#create'
  post 'logout' => 'sessions#destroy'

  resources :users, only: [:show, :new, :create] do
    resources :goals
  end

  resources :entries

  get '/auth/github/callback' => 'sessions#github_login'
end
