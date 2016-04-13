module Api
  module V1
    module Invoices
      class MerchantController < ApiController
        respond_to :json

        def show
          respond_with Invoice.find_by(id: params[:invoice_id]).merchant
        end
      end
    end
  end
end
