module Api
  module V1
    module InvoiceItems
      class ItemController < ApiController
        respond_to :json

        def show
          respond_with InvoiceItem.find_by(id: params[:invoice_item_id]).item
        end
      end
    end
  end
end
