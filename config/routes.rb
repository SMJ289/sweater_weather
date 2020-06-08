Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecast#show'
      get 'foodie', to: 'foodie#show'
    end
  end
end
