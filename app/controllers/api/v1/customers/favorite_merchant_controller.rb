module Api
  module V1
    module Customers
      class FavoriteMerchantController < ApiController
        respond_to :json

        def show
          respond_with Customer.find_by(id: params[:customer_id]).favorite_merchant
        end
      end
    end
  end
end
