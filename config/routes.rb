Rails.application.routes.draw do
  resources :events
  resources :letter_recipients
  resources :letter_authors
  resources :letters
  resources :recipients
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
