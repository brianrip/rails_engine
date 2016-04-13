module Api
  module V1
    module InvoiceItems
      class InvoiceController < ApiController
        respond_to :json

        def index
          respond_with InvoiceItem.find_by(id: params[:invoice_item_id]).invoice
        end
      end
    end
  end
end
