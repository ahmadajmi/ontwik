Rails.application.routes.draw do
  resources :videos
  # resources :users

  get 'follow' => 'users#follow'
  get 'unfollow' => 'users#unfollow'
  get 'like' => 'users#like'
  get 'unlike' => 'users#unlike'
  get 'videos/new'

  get 'videos/create'

  resources :users, :only => [:index, :show]
  root to: 'videos#home'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get 'tags/:tag', to: 'videos#index', as: :tag

end
