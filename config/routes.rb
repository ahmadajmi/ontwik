Rails.application.routes.draw do

  root to: 'talks#home'

  resources :talks
  resources :profiles
  resources :comments

  get 'follow' => 'profiles#follow'
  get 'unfollow' => 'profiles#unfollow'
  get 'like' => 'profiles#like'
  get 'unlike' => 'profiles#unlike'
  get 'talks/new'

  get 'talks/create'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get 'tags', to: 'talks#index'
  get 'tags/:tag', to: 'talks#index', as: :tag

  get ':id', :to => "profiles#show"

end