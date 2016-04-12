module Api
  module V1
    class InvoicesFinderController < ApiController
      respond_to :json

      def index
        respond_with  Invoice.where(invoice_params)
      end

      def show
        respond_with Invoice.where(invoice_params).take
      end

      private

        def invoice_params
          params.permit(:customer_id, :merchant_id, :status)
        end
    end
  end
end
