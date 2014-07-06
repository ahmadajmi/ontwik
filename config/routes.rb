Rails.application.routes.draw do
  resources :videos
  # get 'videos/index'

  # get 'videos/show'

  get 'videos/new'

  get 'videos/create'

  # get 'videos/edit'

  # get 'videos/destroy'

  resources :users, :only => [:index, :show]
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
