Rails.application.routes.draw do
  resources :legals
  resources :abouts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :messages do
    collection do
      post 'reply'
      get 'reply'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'twilio/voice' => 'twilio#voice'
  root "application#index"
  resources :webpages
end
