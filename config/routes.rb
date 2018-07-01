Rails.application.routes.draw do
  resources :legals
  resources :abouts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :webpages
end
