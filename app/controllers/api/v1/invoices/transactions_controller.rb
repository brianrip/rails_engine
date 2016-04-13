module Api
  module V1
    module Invoices
      class TransactionsController < ApiController
        respond_to :json

        def index
          respond_with Transaction.where(invoice_id: params[:invoice_id])
        end
      end
    end
  end
end
