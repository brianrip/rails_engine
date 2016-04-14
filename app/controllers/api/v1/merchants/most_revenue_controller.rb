module Api
  module V1
    module Merchants
      class MostRevenueController < ApiController
        respond_to :json

        def index
          respond_with Merchant.most_revenue(params[:quantity])
        end
      end
    end
  end
end
