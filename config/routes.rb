Rails.application.routes.draw do
  resources :items do
    resources :tags, only: %i[create destroy]
    collection do
      get 'past'
    end
  end
  resources :users, only: %i[create]
  resources :goods, only: %i[create destroy]
  get '/' => 'home#top'
  get '/dashboard' => 'home#dashboard'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'signin' => 'user_sessions#new'
  post 'signin' =>'user_sessions#create'
  delete 'signout' => 'user_sessions#destroy'
end
