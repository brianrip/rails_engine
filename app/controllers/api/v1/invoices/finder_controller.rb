module Api
  module V1
    module Invoices
      class FinderController < ApiController
        respond_to :json

        def index
          respond_with Invoice.where(invoice_params)
        end

        def show
          respond_with Invoice.where(invoice_params).take
        end

        private

          def invoice_params
            params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
          end
      end
    end
  end
end
