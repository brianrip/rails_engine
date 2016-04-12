module Api
  module V1
    class InvoicesController < ApiController
      respond_to :json

      def index
        respond_with  Invoice.all
      end

      def show
        respond_with Invoice.find(params[:id])
      end
    end
  end
end
