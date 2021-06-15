Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/backgrounds', to: 'background#index'

      post '/users', to: 'user#create'
      post '/sessions', to: 'session#create'
      post '/road_trip', to: 'road_trip#create'
    end
  end
end
