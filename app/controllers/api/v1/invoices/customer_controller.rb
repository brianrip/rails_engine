module Api
  module V1
    module Invoices
      class CustomerController < ApiController
        respond_to :json

        def show
          respond_with Invoice.find_by(id: params[:invoice_id]).customer
        end
      end
    end
  end
end
