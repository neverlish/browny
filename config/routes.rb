Rails.application.routes.draw do
  resources :sayings
  resources :spots do
  	resources :posts
  end
  devise_for :users

  root 'welcome#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
