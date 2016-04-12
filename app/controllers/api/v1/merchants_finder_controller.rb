module Api
  module V1
    class MerchantsFinderController < ApiController
      respond_to :json

      def index
        respond_with  Merchant.where(merchant_params)
      end

      def show
        respond_with Merchant.where(merchant_params).take
      end

      private

        def merchant_params
          params.permit(:name, :created_at, :updated_at)
        end
    end
  end
end
