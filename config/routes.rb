Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        get :items, to: "merchants/items#index"
        get :invoices, to: "merchants/invoices#index"

        collection do
          get :find_all, to: "merchants/finder#index"
          get :find,     to: "merchants/finder#show"
          get :random,   to: "merchants/random#show"
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get :find_all, to: "customers/finder#index"
          get :find,     to: "customers/finder#show"
          get :random,   to: "customers/random#show"
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get :find_all, to: "items/finder#index"
          get :find,     to: "items/finder#show"
          get :random,   to: "items/random#show"
        end
      end

      resources :invoices, only: [:index, :show] do
        get :transactions,  to: "invoices/transactions#index"
        get :invoice_items, to: "invoices/invoice_items#index"
        get :items,         to: "invoices/items#index"
        get :customer,     to: "invoices/customer#index"
        get :merchant,     to: "invoices/merchant#index"

        collection do
          get :find_all, to: "invoices/finder#index"
          get :find,     to: "invoices/finder#show"
          get :random,   to: "invoices/random#show"
        end
      end

      resources :transactions, only: [:index, :show] do

        collection do
          get :find_all, to: "transactions/finder#index"
          get :find,     to: "transactions/finder#show"
          get :random,   to: "transactions/random#show"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        get :invoice, to: "invoice_items/invoice#index"
        get :item, to: "invoice_items/item#index"

        collection do
          get :find_all, to: "invoice_items/finder#index"
          get :find,     to: "invoice_items/finder#show"
          get :random,   to: "invoice_items/random#show"
        end
      end
    end
  end

end
