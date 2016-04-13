module Api
  module V1
    module Customers
      class InvoicesController < ApiController
        respond_to :json

        def index
          respond_with Customer.find_by(id: params[:customer_id]).invoices
        end
      end
    end
  end
end
