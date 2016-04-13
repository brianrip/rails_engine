module Api
  module V1
    module Merchants
      class CustomersWithPendingInvoicesController < ApiController
        respond_to :json

        def show
          respond_with Merchant.find_by(id: params[:merchant_id]).customers_with_pending_invoices
        end
      end
    end
  end
end
