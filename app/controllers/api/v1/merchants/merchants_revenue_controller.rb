module Api
  module V1
    module Merchants
      class MerchantsRevenueController < ApiController
        respond_to :json

        def show
          if params[:date]
            respond_with Merchant.find_by(id: params[:merchant_id]).revenue_by_date(params[:date])
          else
            respond_with Merchant.find_by(id: params[:merchant_id]).revenue
          end
        end
      end
    end
  end
end
