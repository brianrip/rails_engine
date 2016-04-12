module Api
  module V1
    class CustomersFinderController < ApiController
      respond_to :json

      def index
        respond_with  Customer.where(customer_params)
      end

      def show
        respond_with Customer.where(customer_params).take
      end

      private

        def customer_params
          params.permit(:first_name, :last_name, :created_at, :updated_at)
        end
    end
  end
end
