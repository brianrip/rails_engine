Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get :find_all, to: "merchants/finder#index"
          get :find,     to: "merchants/finder#show"
          get :random,   to: "merchants_random#show"
        end
      end
      resources :customers, only: [:index, :show] do
        collection do
          get :find_all, to: "customers_finder#index"
          get :find,     to: "customers_finder#show"
          get :random,   to: "customers_random#show"
        end
      end
      resources :items, only: [:index, :show] do
        collection do
          get :find_all, to: "items_finder#index"
          get :find,     to: "items_finder#show"
          get :random,   to: "items_random#show"
        end
      end
      resources :invoices, only: [:index, :show] do
        collection do
          get :find_all, to: "invoices_finder#index"
          get :find,     to: "invoices_finder#show"
          get :random,   to: "invoices_random#show"
        end
      end
      resources :transactions, only: [:index, :show] do
        collection do
          get :find_all, to: "transactions_finder#index"
          get :find,     to: "transactions_finder#show"
          get :random,   to: "transactions_random#show"
        end
      end
    end
  end

end
