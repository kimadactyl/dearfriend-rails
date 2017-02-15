Rails.application.routes.draw do

  namespace :admin do
    resources :authors
    resources :admin_users
    resources :events
    resources :letters
    resources :letter_authors
    resources :letter_recipients
    resources :recipients
    root to: "letters#index"
  end

  resources :events, only: [:index]
  resources :letter_recipients, only: [:index, :show]
  resources :letter_authors, only: [:index, :show]
  resources :letters, only: [:index, :show]
  resources :recipients, only: [:index, :show]
  resources :authors, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/contact", to: "static_pages#contact"
  get "/contribute", to: "static_pages#contribute"
  root to: "static_pages#index"
end
