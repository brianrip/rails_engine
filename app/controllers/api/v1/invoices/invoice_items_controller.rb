module Api
  module V1
    module Invoices
      class InvoiceItemsController < ApiController
        respond_to :json

        def index
          respond_with InvoiceItem.where(invoice_id: params[:invoice_id])
        end
      end
    end
  end
end
