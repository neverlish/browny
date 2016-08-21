Rails.application.routes.draw do
	resources :cities
	resources :places
  resources :spots do
  	resources :posts, except: [:index]
  	post "like", to: "likes#like_toggle"
  end
  get '/posts' => 'posts#index'
  get '/posts/:category' => 'spots#category'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
