Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  #get 'pages/debug', to: 'pages#debug'

  get "components", to: "pages#components"


  # routes to find objects related to a user
  resources :users do
    resources :accounts, only: [:index, :edit, :update]
    resources :socials, only: [:index ]
    resources :criteria, only:[:index, :edit, :update, :show ]
  end

  #routes unique for the onboarding forms of a new candidate
  resources :accounts, only: [:new, :create]
  resources :criteria, only: [:new, :create, :edit, :update, :show]
  resources :socials, only: [:new, :create]



end
