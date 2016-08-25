Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
	resources :cities do
    resources :places
  end
	resources :places do
    resources :spots 
    get '/spots/category/:category' => 'spots#category'
  end
  resources :spots do
    resources :posts, except: [:index] do
      post "like", to: "likes#like_post_toggle"
    end
    post "like", to: "likes#like_spot_toggle"
    get 'map' => 'spots#map'
  end

  get '/mypage' => 'mypage#my'
  get '/user/:id' => 'mypage#user'

  resources :posts

  get '/spots/category/:category' => 'spots#category'
  get '/welcome/index'
  get '/map' => 'spots#all_map'

  root 'welcome#main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
