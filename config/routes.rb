Rails.application.routes.draw do
  resources :events
  resources :registered_applications
  
  resources :registered_application do
    resources :events
  end

  devise_for :users
  
root 'welcome#index'
end
