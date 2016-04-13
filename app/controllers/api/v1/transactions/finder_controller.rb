module Api
  module V1
    module Transactions
      class FinderController < ApiController
        respond_to :json

        def index
          respond_with  Transaction.where(transaction_params)
        end

        def show
          respond_with Transaction.where(transaction_params).take
        end

        private

          def transaction_params
            params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
          end
      end
    end
  end
end
