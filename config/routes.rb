Rails.application.routes.draw do
  resources :talks
  resources :users

  get 'follow' => 'users#follow'
  get 'unfollow' => 'users#unfollow'
  get 'like' => 'users#like'
  get 'unlike' => 'users#unlike'
  get 'talks/new'

  get 'talks/create'

  root to: 'talks#home'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get 'tags/:tag', to: 'talks#index', as: :tag

end
