Rails.application.routes.draw do
  devise_for :users
  
  resources :likes, only: [:new, :create, :destroy]
 
  resources :users

  root to: "tweets#index"


     resources :tweets do
      resources :likes
    end
    

  post '/:username/follow', to: 'relationships#create', as: :follow

  resources :tweets

  get '/:username', to: "profile#index", as: :profile
end
