Rails.application.routes.draw do
  resources :topics

  resources :talks
  resources :speakers

  get 'follow' => 'speakers#follow'
  get 'unfollow' => 'speakers#unfollow'
  get 'like' => 'speakers#like'
  get 'unlike' => 'speakers#unlike'
  get 'talks/new'

  get 'talks/create'

  root to: 'talks#home'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get 'tags', to: 'talks#index'
  get 'tags/:tag', to: 'talks#index', as: :tag

  scope ":nickname" do
    get '', to: 'speakers#show'
  end

  scope ":nickname/:edit" do
    get '', to: 'speakers#edit'
  end

end
