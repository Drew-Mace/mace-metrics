Rails.application.routes.draw do
  resources :events, only: [:create]
  resources :registered_applications
  
  resources :registered_application do
    resources :events
  end
  
  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end
  
  match '/events', to: 'events#preflight', via: [:options]

  devise_for :users
  
root 'welcome#index'
end
