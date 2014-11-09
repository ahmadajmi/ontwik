Rails.application.routes.draw do
  resources :topics

  resources :talks
  resources :profiles
  resources :comments

  get 'follow' => 'profiles#follow'
  get 'unfollow' => 'profiles#unfollow'
  get 'like' => 'profiles#like'
  get 'unlike' => 'profiles#unlike'
  get 'talks/new'

  get 'talks/create'

  root to: 'talks#home'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get 'tags', to: 'talks#index'
  get 'tags/:tag', to: 'talks#index', as: :tag

  # scope ":nickname" do
  #   get '', to: 'profiles#show'
  # end

  # scope ":nickname/:edit" do
  #   get '', to: 'profiles#edit'
  # end

end
