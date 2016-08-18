Rails.application.routes.draw do
  resources :sayings
  resources :spots do
  	resources :posts, except: [:index]
  end
  get '/posts' => 'posts#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}


  root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
