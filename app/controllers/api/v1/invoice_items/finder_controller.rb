module Api
  module V1
    module InvoiceItems
      class FinderController < ApiController
        respond_to :json

        def index
          respond_with InvoiceItem.where(customer_params)
        end

        def show
          respond_with InvoiceItem.where(customer_params).take
        end

        private

          def customer_params
            params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
          end
      end
    end
  end
end
