Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")


  # routes to find objects related to a user
  resources :users do
    resources :accounts, only: [:index, :edit, :update]
    resources :socials, only: [:index ]
    resources :criteria, only:[:index, :edit, :update ]
  end

  #routes unique for the onboarding forms of a new candidate
  resources :accounts, only: [:new, :create]
  resources :criteria, only: [:new, :create, :edit, :update]
  resources :socials, only: [:new, :create]



end
