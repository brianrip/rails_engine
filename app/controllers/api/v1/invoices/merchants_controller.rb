module Api
  module V1
    module Invoices
      class MerchantsController < ApiController
        respond_to :json

        def index
          respond_with Merchant.where(invoice_id: params[:invoice_id])
        end
      end
    end
  end
end
