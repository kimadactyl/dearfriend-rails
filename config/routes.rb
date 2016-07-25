Rails.application.routes.draw do
  resources :events
  resources :letter_recipients
  resources :letter_authors
  resources :letters
  resources :recipients
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/contact", to: "static_pages#contact"
  get "/contribute", to: "static_pages#contribute"
  root to: "static_pages#index"
end
