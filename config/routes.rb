Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        get :items, to: "merchants/items#index"
        get :invoices, to: "merchants/invoices#index"
        get :revenue, to: "merchants/merchants_revenue#show"
        get :favorite_customer, to: "merchants/favorite_customer#show"
        get :customers_with_pending_invoices, to: "merchants/customers_with_pending_invoices#show"

        collection do
          get :find_all, to: "merchants/finder#index"
          get :find,     to: "merchants/finder#show"
          get :random,   to: "merchants/random#show"
          get :most_revenue,   to: "merchants/most_revenue#index"
        end
      end

      resources :customers, only: [:index, :show] do
        get :transactions, to: "customers/transactions#index"
        get :invoices, to: "customers/invoices#index"
        get :favorite_merchant, to: "customers/favorite_merchant#show"

        collection do
          get :find_all, to: "customers/finder#index"
          get :find,     to: "customers/finder#show"
          get :random,   to: "customers/random#show"
        end
      end

      resources :items, only: [:index, :show] do
        get :merchant,      to: "items/merchant#show"
        get :invoice_items, to: "items/invoice_items#index"
        get :best_day,      to: "items/best_day#show"

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
        get :customer,     to: "invoices/customer#show"
        get :merchant,     to: "invoices/merchant#show"

        collection do
          get :find_all, to: "invoices/finder#index"
          get :find,     to: "invoices/finder#show"
          get :random,   to: "invoices/random#show"
        end
      end

      resources :transactions, only: [:index, :show] do
        get :invoice, to: "transactions/invoice#show"

        collection do
          get :find_all, to: "transactions/finder#index"
          get :find,     to: "transactions/finder#show"
          get :random,   to: "transactions/random#show"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        get :invoice, to: "invoice_items/invoice#show"
        get :item, to: "invoice_items/item#show"

        collection do
          get :find_all, to: "invoice_items/finder#index"
          get :find,     to: "invoice_items/finder#show"
          get :random,   to: "invoice_items/random#show"
        end
      end
    end
  end
end
