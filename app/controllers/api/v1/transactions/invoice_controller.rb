module Api
  module V1
    module Transactions
      class InvoiceController < ApiController
        respond_to :json

        def show
          respond_with Transaction.find_by(id: params[:transaction_id]).invoice
        end
      end
    end
  end
end
