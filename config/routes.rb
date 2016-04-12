Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get :find_all, to: "merchants_finder#index"
          get :find,     to: "merchants_finder#show"
        end
      end
      resources :customers, only: [:index, :show] do
        collection do
          get :find_all, to: "customers_finder#index"
          get :find,     to: "customers_finder#show"
        end
      end
    end
  end

end
