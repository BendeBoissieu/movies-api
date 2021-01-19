Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :movies, only: [ :index ]
      resources :seasons, only: [ :index ]
      resources :libraries, only: [ :index ]
      resources :users do
        resources :purchases, only: [ :index, :create]
      end
    end
  end

end

