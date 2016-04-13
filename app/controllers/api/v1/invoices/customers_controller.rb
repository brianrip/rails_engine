module Api
  module V1
    module Invoices
      class CustomersController < ApiController
        respond_to :json

        def index
          respond_with Customer.where(invoice_id: params[:invoice_id])
        end
      end
    end
  end
end
