Rails.application.routes.draw do

  # Clearance
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  # Administrate
  namespace :admin do
    resources :authors
    resources :events
    resources :letters
    resources :letter_authors
    resources :letter_recipients
    resources :recipients
    resources :users

    root to: "letters#index"
  end

  # App itself
  resources :events, only: [:index]
  resources :letter_recipients, only: [:index, :show]
  resources :letter_authors, only: [:index, :show]
  resources :letters, only: [:index, :show]
  resources :recipients, only: [:index, :show]
  resources :authors, only: [:index, :show, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/contact", to: "static_pages#contact"
  get "/contribute", to: "static_pages#contribute"
  root to: "static_pages#index"
end
