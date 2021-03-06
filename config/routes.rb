Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecast#show'
      get 'backgrounds', to: 'background#show'
      post 'users', to: 'user#create'
      post 'sessions', to: 'sessions#create'
      post 'road_trip', to: 'road_trip#show'
    end
  end
end
