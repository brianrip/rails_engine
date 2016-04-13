module Api
  module V1
    module Items
      class InvoiceItemsController < ApiController
        respond_to :json

        def index
          respond_with Item.find_by(id: params[:item_id]).invoice_items
        end
      end
    end
  end
end
