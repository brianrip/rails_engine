module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApiController
        respond_to :json

        def show
            respond_with Merchant.find_by(id: params[:merchant_id]).favorite_customer
        end
      end
    end
  end
end
