module Api
  module V1
    class TransactionsFinderController < ApiController
      respond_to :json

      def index
        respond_with  Transaction.where(transaction_params)
      end

      def show
        respond_with Transaction.where(transaction_params).take
      end

      private

        def transaction_params
          params.permit(:invoice_id, :credit_card_number, :result)
        end
    end
  end
end
