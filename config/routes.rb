Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  root to: "users#index"

  resources :users do
    resources :entries do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  resources :comments, only: [:edit, :update]

  resources :sessions
end
